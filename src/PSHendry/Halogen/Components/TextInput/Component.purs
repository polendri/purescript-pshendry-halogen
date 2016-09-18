-- | An <input> component accepting any text.
module PSHendry.Halogen.Components.TextInput where

import PSHendry.Prelude
import Halogen.HTML.Properties.Indexed as HP

import DOM (DOM)
import Halogen as H
import PSHendry.Halogen.Components.Input (Query, State, mkComponent)

component :: forall e. H.Component (State String) (Query String) (Aff (dom :: DOM | e))
component = mkComponent HP.InputText id Just
