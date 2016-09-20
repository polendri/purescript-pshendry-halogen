-- | An <input> component accepting floating-point numbers.
module PSHendry.Halogen.Components.NumberInput
  ( module PSHendry.Halogen.Components.NumberInput
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Number (parseNumber)
import PSHendry.Halogen.Components.Input (InputQuery(..), InputState)
import PSHendry.Halogen.Components.Input as Input

type Query = InputQuery Number

type State = Input.InputState Number

component :: forall e. H.Component State Query (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputNumber show parseNumber
