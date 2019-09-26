module FindingSuccessInHaskell.Chapter01
  ( absVal,
    validateUsernamePassword,
    safeHead,
    safeTail    
  ) where 

import Data.List
               
absVal :: (Num a, Ord a) => a -> a
absVal x = case (x < 0) of
                 True -> (negate x)
                 False -> x

validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password =
  case (null username, null password) of
    (True, True) -> "Empty username and password"
    (True, False) -> "Empty username"
    (False, True) -> "Empty password"
    (False, False) -> "Okay"

safeTail :: [a] -> Maybe [a]
safeTail (x:xs) = Just xs
safeTail [] = Nothing

safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just x
safeHead [] = Nothing
