{ pkgs, lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "space-sddm-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "EliverLara";
    repo = "Space-kde";
    rev = "master"; #last word in url.
    sha256 = "0p29ixghrwabydfm67ys5g1plgpvhln3834kwnpnbk4nx8n5hhiz";
    #nix-prefetch-url --unpack https://github.com/EliverLara/Space-kde/archive/master.tar.gz
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes/Space
    cp -r sddm/Space/* $out/share/sddm/themes/Space/
  '';

  meta = with lib; {
    description = "Space SDDM theme for KDE";
    homepage = "https://github.com/EliverLara/Space-kde";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
