module FindingSuccessInHaskell.Chapter04
  (
    reverseLine
  ) where

import Data.List
import Data.Char

reverseLine :: IO ()
reverseLine =
  do
    line <- getLine
    print (reverse line)

bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe Nothing f = Nothing
bindMaybe (Just x) f = f x

data StringOrValue a = Str String | Val a deriving Show

bindStringOrValue
    :: StringOrValue a
    -> (a -> StringOrValue b)
    -> StringOrValue b
bindStringOrValue (Str s) f = Str s
bindStringOrValue (Val v) f = f v
