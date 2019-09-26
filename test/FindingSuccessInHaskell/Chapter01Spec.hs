{-# LANGUAGE ScopedTypeVariables #-}

module FindingSuccessInHaskell.Chapter01Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import FindingSuccessInHaskell.Chapter01 (absVal, validateUsernamePassword, safeHead, safeTail)

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
  describe "safeTail" $ do
    it "should return just the tail if it exists or nothing if not" $ do
      (safeTail [1, 2]) `shouldBe` (Just [2])
      (safeTail []) `shouldBe` (Nothing :: Maybe Int)
  describe "safeHead" $ do
    it "should return just the head if it exists or nothing if not" $ do
      (safeHead [1, 2]) `shouldBe` (Just 1)
      (safeHead []) `shouldBe` (Nothing :: Maybe Int)

