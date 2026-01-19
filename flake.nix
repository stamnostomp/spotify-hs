{
  description = "spotify tui player with haskell and bricks";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        spotifyHSPkg = pkgs.haskellPackages.callPackage ./default.nix { };
      in
      {
        packages.default = spotifyHSPkg;

        devShells.default = pkgs.haskellPackages.shellFor {
          packages = p: [ spotifyHSPkg ];
          buildInputs =
            with pkgs.haskellPackages;
            [
              cabal-install
              brick
              vty
            ]
            ++ (with pkgs; [
              ghc
              cabal2nix
            ]);
        };
      }
    );
}
