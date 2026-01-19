{ mkDerivation, base, brick, lib, vty }:
mkDerivation {
  pname = "spotify-hs";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base brick vty ];
  homepage = "https://github.com/stamnostomp/spotify-hs";
  description = "spotify tui app";
  license = lib.licenses.bsd3;
  mainProgram = "spotify-hs";
}
