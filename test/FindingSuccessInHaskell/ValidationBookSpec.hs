module FindingSuccessInHaskell.ValidationBookSpec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import FindingSuccessInHaskell.ValidationBook (checkPasswordLength, cleanWhitespace, requireAlphaNum)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "checkPasswordLength" $ do
    let errorMessage = "Passwords cannot be less than 10 or more than 20 characters long"
    it "should only accept lengths of between 10 and 20 characters" $ do
      checkPasswordLength "123456789" `shouldBe` Left errorMessage
      checkPasswordLength "12345678901234567890" `shouldBe` Right "12345678901234567890"
      checkPasswordLength "123456789012345678901" `shouldBe` Left errorMessage
  describe "requireAlphaNum" $ do
    let errorMessage = "Passwords cannot contain non-alphanumeric characters"
    it "should only accept passwords with alphanumeric characters" $ do
      requireAlphaNum "abc-123" `shouldBe` Left errorMessage
      requireAlphaNum "abc123" `shouldBe` Right "abc123"
  describe "cleanWhitespace" $ do
    let errorMessage = "Passwords cannot be blank"
    it "should remove leading whichspace and only accept non-blank passwords" $ do
      cleanWhitespace "" `shouldBe` Left errorMessage
      cleanWhitespace "  " `shouldBe` Left errorMessage
      cleanWhitespace "abc" `shouldBe` Right "abc"
      cleanWhitespace "   abc" `shouldBe` Right "abc"
      
      

      
