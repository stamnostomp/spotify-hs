{
  description = "spotify tui player with haskell and bricks";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          ghc
          cabal2nix
        ];

        shellHook = ''
          echo "spotify.hs dev shell"
        '';
      };
    };
}
