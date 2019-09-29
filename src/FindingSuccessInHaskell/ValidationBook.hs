module FindingSuccessInHaskell.ValidationBook
  ( checkPasswordLength
  , requireAlphaNum
  , cleanWhitespace
  ) where

import Data.Char (isAlphaNum, isSpace)
import Data.Either

checkPasswordLength :: String -> Either String String
checkPasswordLength password =
  case ((passwordLength < 10) || (passwordLength > 20)) of
    True -> Left "Passwords cannot be less than 10 or more than 20 characters long"
    False -> Right password
  where
    passwordLength = length password

requireAlphaNum :: String -> Either String String
requireAlphaNum password =
  case (all isAlphaNum password) of
    False -> Left "Passwords cannot contain non-alphanumeric characters"
    True -> Right password

cleanWhitespace :: String -> Either String String
cleanWhitespace "" = Left "Passwords cannot be blank"
cleanWhitespace (x : xs) =
  case (isSpace x) of
    True -> cleanWhitespace xs
    False -> Right (x : xs)

