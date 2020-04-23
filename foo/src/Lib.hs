module Lib where

import           Aws.Lambda (Context)
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy.Char8 as BLC

handler :: A.Value -> Context -> IO (Either String A.Value)
handler event ctx = do
  putStrLn $ "event: " ++ show event
  putStrLn $ "context: " ++ BLC.unpack (A.encode ctx)
  return $ Right event
