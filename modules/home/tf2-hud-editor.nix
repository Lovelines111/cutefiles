{ stdenv, fetchzip, makeWrapper, lib, dotnet-sdk, icu, fontconfig, libX11, libXrandr, libXi, libXcursor, libGL, libICE, libSM, writeShellScript }:

let
  # Create a wrapper script that sets up a writable runtime directory
  wrapperScript = writeShellScript "tf2hud-editor-wrapper" ''
    set -e
    
    # Set up runtime directory
    RUNTIME_DIR="$HOME/.local/share/tf2hud-editor/runtime"
    CACHE_DIR="$HOME/.local/share/tf2hud-editor/cache"
    
    # Create directories
    mkdir -p "$RUNTIME_DIR" "$CACHE_DIR"
    
    # Copy application files if not present or if they're older than the source
    if [ ! -f "$RUNTIME_DIR/HUDEditor" ] || [ "@out@/share/tf2hud-editor/HUDEditor" -nt "$RUNTIME_DIR/HUDEditor" ]; then
      echo "Setting up TF2 HUD Editor runtime environment..."
      # Remove old runtime directory to ensure clean state
      rm -rf "$RUNTIME_DIR"
      mkdir -p "$RUNTIME_DIR"
      
      # Copy files and immediately fix permissions
      cp -r "@out@/share/tf2hud-editor"/* "$RUNTIME_DIR/"
      
      # Fix permissions immediately after copying
      chmod -R u+w "$RUNTIME_DIR"
      find "$RUNTIME_DIR" -type d -exec chmod 755 {} \;
      find "$RUNTIME_DIR" -type f -exec chmod 644 {} \;
      chmod +x "$RUNTIME_DIR/HUDEditor"
    else
      # Even if we don't copy, ensure permissions are correct
      chmod -R u+w "$RUNTIME_DIR"
      find "$RUNTIME_DIR" -type d -exec chmod 755 {} \;
    fi
    
    # Ensure all necessary directories exist and are writable
    mkdir -p "$RUNTIME_DIR/cache"
    mkdir -p "$RUNTIME_DIR/JSON/Local" 
    mkdir -p "$RUNTIME_DIR/JSON/Remote"
    
    # Set up environment
    export PATH="${lib.makeBinPath [ dotnet-sdk ]}:$PATH"
    export LD_LIBRARY_PATH="${lib.makeLibraryPath [ 
      icu 
      dotnet-sdk 
      fontconfig 
      libX11 
      libXrandr 
      libXi 
      libXcursor 
      libGL
      libICE
      libSM
    ]}:''${LD_LIBRARY_PATH:-}"
    export DOTNET_ROOT="${dotnet-sdk}"
    export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0
    export ICU_DATA_DIR="${icu}/lib"
    export FONTCONFIG_FILE="${fontconfig.out}/etc/fonts/fonts.conf"
    export FONTCONFIG_PATH="${fontconfig.out}/etc/fonts"
    
    # Change to runtime directory and execute
    cd "$RUNTIME_DIR"
    exec "$RUNTIME_DIR/HUDEditor" "$@"
  '';
in
stdenv.mkDerivation rec {
  pname = "tf2hud-editor";
  version = "4.2";
  
  src = fetchzip {
    url = "https://github.com/CriticalFlaw/TF2HUD.Editor/releases/download/4.2/tf2hud-editor-linux.zip";
    sha256 = "sha256-wY2L6RnTVGERailQpqS1KLdTgwlaDXUMQnU/SYX4AtA=";
    stripRoot = false;
  };
  
  nativeBuildInputs = [ makeWrapper ];
  
  buildInputs = [ 
    icu 
    fontconfig 
    libX11 
    libXrandr 
    libXi 
    libXcursor 
    libGL
    libICE
    libSM
  ];
  
  installPhase = ''
    mkdir -p $out/bin $out/share/${pname}
    cp -r $src/* $out/share/${pname}/
    
    chmod +x $out/share/${pname}/HUDEditor
    
    # Install the wrapper script
    cp ${wrapperScript} $out/bin/tf2hud-editor
    chmod +x $out/bin/tf2hud-editor
    
    # Substitute the @out@ placeholder in the wrapper script
    substituteInPlace $out/bin/tf2hud-editor \
      --replace "@out@" "$out"
  '';
  
  meta = with lib; {
    description = "Team Fortress 2 HUD Editor";
    homepage = "https://github.com/CriticalFlaw/TF2HUD.Editor";
    license = licenses.free; 
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
