module Main where

import Data.Char (isAlphaNum, isSpace)

checkPasswordLength :: String -> Maybe String
checkPasswordLength password =
  case ((passwordLength < 10) || (passwordLength > 20)) of
    True -> Nothing
    False -> Just password
  where
    passwordLength = length password

requireAlphaNum :: String -> Maybe String
requireAlphaNum password =
  case (all isAlphaNum password) of
    False -> Nothing
    True -> Just password

cleanWhitespace :: String -> Maybe String
cleanWhitespace "" = Nothing
cleanWhitespace (x : xs) =
  case (isSpace x) of
    True -> cleanWhitespace xs
    False -> Just (x : xs)

validatePassword :: String -> Maybe String
validatePassword password =
    cleanWhitespace password
        >>= requireAlphaNum
        >>= checkPasswordLength

main :: IO ()
main = do
  putStr "Please enter a password\n> "
  password <- getLine
  print (checkPasswordLength password)
