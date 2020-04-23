let pkgs = import ../nix/pkgs.nix;
in pkgs.runCommand "dummy" {
  buildInputs = [ (pkgs.haskell.packages.ghc802.ghcWithPackages (hs: [ hs.cabal-install ])) ];
} ":"
