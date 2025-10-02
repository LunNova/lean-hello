{
  description = "Lean4 development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            lean4
            elan
            git
            curl
          ];

          shellHook = ''
            echo "Lean: $(lean --version)
            Elan: $(elan --version)
            Build: lake build
            Run: lake exe LeanTemplate"
          '';
        };
      });
}
