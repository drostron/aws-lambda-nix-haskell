{ mkDerivation, base, stdenv, aws-lambda-haskell-runtime, aeson, bytestring }:
mkDerivation {
  pname = "foo";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base aeson aws-lambda-haskell-runtime bytestring ];
  license = stdenv.lib.licenses.free;
}
