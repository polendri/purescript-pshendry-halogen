-- | An <input> component accepting any text.
module PSHendry.Halogen.Components.TextInput where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Halogen.Components.Input as Input

type Query = Input.Query String

type State = Input.State String

component :: forall e. H.Component State Query (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputText id Just
