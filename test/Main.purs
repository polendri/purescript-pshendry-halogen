module Test.Main where

import Prelude
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)

import Test.PSHendry.Data.Int as DataInt
import Test.PSHendry.Data.Number as DataNumber
import Test.PSHendry.Halogen.Components.TextInput.Component as TextInput

main :: forall e. Eff (avar :: AVAR, console :: CONSOLE, testOutput :: TESTOUTPUT | e) Unit
main = runTest do
  DataInt.tests
  DataNumber.tests
