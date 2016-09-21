-- | An <input> component accepting any text.
module PSHendry.Halogen.Components.TextInput
  ( module PSHendry.Halogen.Components.TextInput
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import Control.Monad.Aff.AVar (AVAR)
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Halogen.Components.Input (InputQuery(..), InputState)
import PSHendry.Halogen.Components.Input as Input

type Query = InputQuery String

type State = InputState String

component :: forall e. H.Component State Query (Aff (avar :: AVAR, dom :: DOM | e))
component = Input.mkComponent HP.InputText id Just
