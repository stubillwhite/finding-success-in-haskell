module FindingSuccessInHaskell.Chapter01
  ( absVal
  ) where 

import Data.List
               
absVal :: (Num a, Ord a) => a -> a
absVal x = case (x < 0) of
                 True -> (negate x)
                 False -> x
