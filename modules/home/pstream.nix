{ pkgs ? import <nixpkgs> {} }:

pkgs.appimageTools.wrapType2 {
  pname = "pstream";
  version = "1.0.11";

  src = pkgs.fetchurl {
    url = "https://github.com/afyef/pstream-electron-app/releases/download/v1.0.11/PStream-1.0.11.AppImage";
    sha256 = "sha256-2uIEjvTg2ZOY749rmpsYFOL+AC0Uyu+iXUKcu1lUKDU=";
  };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    cat > $out/share/applications/pstream.desktop <<EOF
    [Desktop Entry]
    Name=PStream
    Exec=${placeholder "out"}/bin/pstream
    Icon=pstream
    Type=Application
    Categories=AudioVideo;Player;Video;
    EOF

    mkdir -p $out/share/icons/hicolor/256x256/apps
    cp $appimageContents/pstream.png $out/share/icons/hicolor/256x256/apps/pstream.png || true
  '';
}
