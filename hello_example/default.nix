let
  pkgs = import <nixpkgs> {};
in
  pkgs.stdenv.mkDerivation rec {
    pname = "hello";
    version = "2.12.1";
    src = pkgs.fetchurl {
      url = "mirror://gnu/hello/hello-${version}.tar.gz";
      sha256 = "sha256-jZkUKv2SV28wsM18tCqNxoCZmLxdYH2Idh9RLibH2yA=";
    };
    postPatch = ''
      sed -i -e 's/world/Marburg/g' src/hello.c
    '';
  }
