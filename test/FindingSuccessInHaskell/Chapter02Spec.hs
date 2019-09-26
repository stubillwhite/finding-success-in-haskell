module FindingSuccessInHaskell.Chapter02Spec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import FindingSuccessInHaskell.Chapter02 (isPalindrome)

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "isPalindrome" $ do
    it "should return true only if the word is a palindrome" $ do
      isPalindrome "foo" `shouldBe` False
      isPalindrome "lol" `shouldBe` True
      isPalindrome "noon" `shouldBe` True
      
