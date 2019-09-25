module FindingSuccessInHaskell.Chapter01
  ( absVal,
    validateUsernamePassword
  ) where 

import Data.List
               
absVal :: (Num a, Ord a) => a -> a
absVal x = case (x < 0) of
                 True -> (negate x)
                 False -> x

validateUsernamePassword :: String -> String -> String
validateUsernamePassword username password =
  if null username
    then (if null password
        then "Empty username and password"
        else "Empty username")
    else (if null password                                     then "Empty password" else "Okay")
