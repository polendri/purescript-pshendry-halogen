-- | An <input> component accepting integers.
module PSHendry.Halogen.Components.IntInput where

import PSHendry.Prelude
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Int (parseInt)

import DOM (DOM)
import Halogen as H
import PSHendry.Halogen.Components.Input (Query, State, mkComponent)

component :: forall e. H.Component (State Int) (Query Int) (Aff (dom :: DOM | e))
component = mkComponent HP.InputNumber show parseInt
