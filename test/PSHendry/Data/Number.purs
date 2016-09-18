module Test.PSHendry.Data.Number ( tests ) where

import Prelude
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

import PSHendry.Data.Number as N

tests :: forall a. TestSuite a
tests = do
  suite "PSHendry.Data.Number" do

    suite "parseNumber" do

      test "fails on a non-number" do
        Assert.equal Nothing $ N.parseNumber "asdf"

      test "succeeds on a positive decimal number" do
        Assert.equal (Just 42.501) $ N.parseNumber "42.501"

      test "succeeds on a negative decimal number" do
        Assert.equal (Just $ negate 42.501) $ N.parseNumber "-42.501"

      test "succeeds on a number with trailing garbage characters" do
        Assert.equal (Just 42.5) $ N.parseNumber "42.5asdf"
