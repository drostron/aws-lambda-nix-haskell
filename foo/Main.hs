{-# LANGUAGE TemplateHaskell #-}

module Main where

import Aws.Lambda

import Lib (handler)

generateLambdaDispatcher
