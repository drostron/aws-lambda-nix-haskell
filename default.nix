let

pkg =
  { patchelf, stdenv, writeText, zip, exe }:
  stdenv.mkDerivation {
    name = "lambda-zip";
    buildCommand = ''
      pushd `mktemp -d`
      cp ${exe} bootstrap

      mkdir lib
      # copy libraries
      cp `ldd bootstrap | grep -F '=> /' | awk '{print $3}'` lib/
      # copy interpreter
      cp `${patchelf}/bin/patchelf --print-interpreter bootstrap` lib/ld.so

      chmod +w bootstrap
      ${patchelf}/bin/patchelf --set-interpreter lib/ld.so bootstrap
      ${patchelf}/bin/patchelf --set-rpath lib bootstrap
      chmod -w bootstrap

      ${zip}/bin/zip -r -9 out.zip ./
      mv out.zip $out

      popd
    '';
  };

in

{ pkgs ? import nix/pkgs.nix }:

let
hs = pkgs.haskell.packages.ghc881;
hsLib = pkgs.haskell.lib;
foo = hsLib.overrideCabal (hs.callPackage ./foo/pkg.nix {}) (old: {
  isLibrary = false;
  enableSharedLibraries = false;
  enableSharedExecutables = false;
});

in
pkgs.callPackage pkg { exe = "${foo}/bin/foo"; }
