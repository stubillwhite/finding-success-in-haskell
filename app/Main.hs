module Main (main) where

import Data.Char (isAlphaNum, isSpace)
import Data.Either
import FindingSuccessInHaskell.ValidationBook (checkPasswordLength, requireAlphaNum, cleanWhitespace)

validatePassword :: String -> Either String String
validatePassword password =
    cleanWhitespace password
        >>= requireAlphaNum
        >>= checkPasswordLength

main :: IO ()
main = do
  putStr "Please enter a password\n> "
  password <- getLine
  print (validatePassword password)

