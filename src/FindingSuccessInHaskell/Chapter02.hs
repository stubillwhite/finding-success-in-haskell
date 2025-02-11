module FindingSuccessInHaskell.Chapter02
  ( isAnagram,
    isWord,
    checkAnagram,
    isPalindrome,
    translateWord
  ) where

import Data.List
import Data.Char

isAnagram :: String -> String -> Bool
isAnagram word1 word2 = (sort word1) == (sort word2)

isWord :: String -> Maybe String
isWord word =
  case (null word) of
    True -> Nothing
    False ->
      case (all isAlpha word) of
        False -> Nothing
        True -> Just word

checkAnagram :: String -> String -> String
checkAnagram word1 word2 =
  case (isWord word1) of
    Nothing -> "The first word is invalid."
    Just word1 ->
      case (isWord word2) of
        Nothing -> "The second word is invalid."
        Just word2 ->
          case (isAnagram word1 word2) of
            False -> "These words are not anagrams."
            True -> "These words are anagrams."

main :: IO ()
main = do
  putStr "Please enter a word.\n> "
  word1 <- getLine
  putStr "Please enter a second word.\n> "
  word2 <- getLine
  print (checkAnagram word1 word2)

isPalindrome :: String -> Bool
isPalindrome s =
  s == (reverse s)

substituteChar :: Char -> Char
substituteChar c =
  case c of
    'e' -> '3'
    'o' -> '0'
    x -> x

translateWord :: String -> String
translateWord s = map substituteChar s

geekTranslator :: IO ()
geekTranslator = do
  putStr "Please enter a word.\n> "
  word <- getLine
  print (translateWord word)
