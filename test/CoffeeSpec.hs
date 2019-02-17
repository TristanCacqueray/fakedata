{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings #-}

module CoffeeSpec where

import Config
import Control.Monad.Catch
import Control.Monad.IO.Class
import qualified Data.Map as M
import Data.Text hiding (all, map)
import qualified Data.Text as T
import Data.Vector (Vector)
import qualified Data.Vector as V
import Faker
import Faker.Coffee
import Faker.Commerce
import Faker.Dota
import qualified Faker.DumbAndDumber as DD
import Faker.Dune
import Faker.Educator
import Faker.Internal
import Faker.Provider.Coffee
import Test.Hspec

spec :: Spec
spec = do
  describe "Coffee" $ do
    it "Nested field" $ do
      ctries <- coffeeRegionsBrazilProvider defaultFakerSettings
      (V.toList ctries) `shouldBe` ["Sul Minas", "Mogiana", "Cerrado"]
    it "Nested field (via TH)" $ do
      ctries <- coffeeRegionsColombiaProvider defaultFakerSettings
      (ctries) `shouldSatisfy` (\x -> V.length x > 3)
    it "random region" $ do
      ctries <- generate regionsColombia
      ctries `shouldBe` "Santander"
    it "brazil region (via TH)" $ do
      ctries <- generate regionsBrazil
      ctries `shouldBe` "Cerrado"
    it "India region (via TH)" $ do
      ctries <- generate regionsIndia
      ctries `shouldBe` "Sheveroys"
  describe "Commerce" $ do
    it "Nested field" $ do
      ctries <- generate product_nameAdjective
      ctries `shouldBe` "Rustic"
  describe "Dota" $ do
    it "Nested field" $ do
      ctries <- generate spirit_breakerQuote
      ctries `shouldSatisfy` (\x -> T.length x > 5)
  describe "Dune" $ do
    it "Nested field" $ do
      ctries <- generate quotesJessica
      ctries `shouldSatisfy` (\x -> T.length x > 5)
  describe "DumbAndDumber" $ do
    it "Nested field" $ do
      ctries <- generate DD.actors
      ctries `shouldSatisfy` (\x -> T.length x > 5)
  describe "Educator" $ do
    it "Nested field" $ do
      ctries <- generate tertiaryType
      ctries `shouldBe` "University"
