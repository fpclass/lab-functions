--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Functions                                                             --
--------------------------------------------------------------------------------

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

import qualified Lab as L

--------------------------------------------------------------------------------

-- | The main entry point to the test suite.
main :: IO ()
main = hspec $ do
    describe "triple" $ do
        prop "triples numbers" $ \(Positive n) ->
            let r = L.triple (n :: Integer) in r `div` 3 == n && r `mod` 3 == 0
    describe "tripleV2" $ do
        prop "triples numbers" $ \(Positive n) ->
            let r = L.tripleV2 (n :: Integer) in r `div` 3 == n && r `mod` 3 == 0
        prop "behaves like triple" $ \(Positive n) ->
            L.triple (n :: Integer) == L.tripleV2 n
    describe "not" $ do
        it "negates booleans" $ L.not True == False && L.not False == True
    describe "and" $ do
        it "implements boolean conjunction" $
            L.and True True == True &&
            L.and False False == False &&
            L.and True False == False &&
            L.and False True == False
    describe "max" $ do
        prop "determines the maximum of two numbers" $ \n m ->
            L.max (n :: Int) (m :: Int) == max n m
    describe "perimeterRect" $ do
        prop "calculates the perimeter" $ \(Positive l) (Positive w) ->
            L.perimeterRect (l :: Int) (w :: Int) == l*2 + w*2

--------------------------------------------------------------------------------
