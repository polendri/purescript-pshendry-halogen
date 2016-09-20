-- | An <input> component accepting floating-point numbers.
module PSHendry.Halogen.Components.NumberInput
  ( component
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Number (parseNumber)
import PSHendry.Halogen.Components.Input (Query(..), State)
import PSHendry.Halogen.Components.Input as Input

component :: forall e. H.Component (State Number) (Query Number) (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputNumber show parseNumber
