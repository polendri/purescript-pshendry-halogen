-- | An <input> component accepting integers.
module PSHendry.Halogen.Components.IntInput where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Int (parseInt)
import PSHendry.Halogen.Components.Input as Input

type Query = Input.Query Int

type State = Input.State Int

component :: forall e. H.Component State Query (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputNumber show parseInt
