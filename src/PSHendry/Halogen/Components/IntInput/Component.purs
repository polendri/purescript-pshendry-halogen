-- | An <input> component accepting integers.
module PSHendry.Halogen.Components.IntInput
  ( component
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Int (parseInt)
import PSHendry.Halogen.Components.Input (Query(..), State)
import PSHendry.Halogen.Components.Input as Input

component :: forall e. H.Component (State Int) (Query Int) (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputNumber show parseInt
