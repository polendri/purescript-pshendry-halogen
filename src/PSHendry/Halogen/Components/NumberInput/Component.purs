-- | An <input> component accepting floating-point numbers.
module PSHendry.Halogen.Components.NumberInput
  ( module PSHendry.Halogen.Components.NumberInput
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import Control.Monad.Aff.AVar (AVAR)
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Number (parseNumber, toPrecision)
import PSHendry.Halogen.Components.Input (InputQuery(..), State)
import PSHendry.Halogen.Components.Input as Input

type Query = InputQuery Number

mkComponent :: forall e
   . Int
  -> H.Component State Query (Aff (avar :: AVAR, dom :: DOM | e))
mkComponent p = Input.mkComponent HP.InputNumber (toPrecision p) parseNumber
