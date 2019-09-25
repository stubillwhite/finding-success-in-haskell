module FindingSuccessInHaskell.Chapter01Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import FindingSuccessInHaskell.Chapter01 (absVal, validateUsernamePassword)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "absVal" $ do
    it "should return the absolute value of positive and negative numbers" $ do
      absVal 10 `shouldBe` 10
      absVal (-10) `shouldBe` 10
  describe "validateUsernamePassword" $ do
    it "should only validate if both username and password are supplied" $ do
      (validateUsernamePassword []         [])         `shouldBe` "Empty username and password"
      (validateUsernamePassword "username" [])         `shouldBe` "Empty password"
      (validateUsernamePassword []         "password") `shouldBe` "Empty username"
      (validateUsernamePassword "username" "password") `shouldBe` "Okay"


