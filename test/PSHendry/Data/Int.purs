module Test.PSHendry.Data.Int ( tests ) where

import Prelude
import Data.Maybe (Maybe(..))
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

import PSHendry.Data.Int as I

tests :: forall a. TestSuite a
tests = do
  suite "PSHendry.Data.Int" do

    suite "parseInt" do

      test "fails on a non-number" do
        Assert.equal Nothing $ I.parseInt "0asdf0"

      test "fails on a non-integer number" do
        Assert.equal Nothing $ I.parseInt "45.3"

      test "succeeds on a positive integer" do
        Assert.equal (Just 42) $ I.parseInt "42"

      test "succeeds on a negative integer" do
        Assert.equal (Just $ negate 42) $ I.parseInt "-42"
