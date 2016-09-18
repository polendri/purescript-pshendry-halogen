-- | An <input> component accepting floating-point numbers.
module PSHendry.Halogen.Components.NumberInput where

import PSHendry.Prelude
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Number (parseNumber)

import DOM (DOM)
import Halogen as H
import PSHendry.Halogen.Components.Input (Query, State, mkComponent)

component :: forall e. H.Component (State Number) (Query Number) (Aff (dom :: DOM | e))
component = mkComponent HP.InputNumber show parseNumber
