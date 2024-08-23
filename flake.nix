{
  description = "Tauri Javascript App";

  inputs = {
    utils.url = "github:numtide/flake-utils";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    poetry2nix,
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      inherit (poetry2nix.lib.mkPoetry2Nix {inherit pkgs;}) mkPoetryApplication overrides;

      myapp = mkPoetryApplication {
        projectDir = self;
        overrides =
          overrides.withDefaults
          (self: super: {
            dppd = super.dppd.overridePythonAttrs (old: {
              nativeBuildInputs = old.nativeBuildInputs ++ [super.setuptools];
            });

            dppd-plotnine = super.dppd-plotnine.overridePythonAttrs (old: {
              nativeBuildInputs = old.nativeBuildInputs ++ [super.setuptools];
            });
          });
      };
    in {
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          yarn
          myapp
        ];
      };
    });
}
