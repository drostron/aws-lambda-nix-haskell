module Main where

import System.Environment as E

main :: IO ()
main = do
  args <- E.getArgs
  putStrLn $ "args: " ++ show args
  i <- getLine
  putStrLn $ "stdin: " ++ i
