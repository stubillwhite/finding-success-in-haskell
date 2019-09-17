module FindingSuccessInHaskell.Chapter01Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import FindingSuccessInHaskell.Chapter01 (absVal)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "absVal" $ do
    it "should return the absolute value of positive and negative numbers" $ do
      absVal 10 `shouldBe` 10
      absVal (-10) `shouldBe` 10
      

