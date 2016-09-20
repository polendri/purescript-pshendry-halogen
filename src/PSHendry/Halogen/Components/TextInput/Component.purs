-- | An <input> component accepting any text.
module PSHendry.Halogen.Components.TextInput
  ( component
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Halogen.Components.Input (Query(..), State)
import PSHendry.Halogen.Components.Input as Input

component :: forall e. H.Component (State String) (Query String) (Aff (dom :: DOM | e))
component = Input.mkComponent HP.InputText id Just
