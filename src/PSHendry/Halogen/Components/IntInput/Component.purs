-- | An <input> component accepting integers.
module PSHendry.Halogen.Components.IntInput
  ( module PSHendry.Halogen.Components.IntInput
  , module PSHendry.Halogen.Components.Input
  ) where

import PSHendry.Prelude
import Control.Monad.Aff.AVar (AVAR)
import DOM (DOM)
import Halogen as H
import Halogen.HTML.Properties.Indexed as HP
import PSHendry.Data.Int (parseInt)
import PSHendry.Halogen.Components.Input (InputQuery(..), State)
import PSHendry.Halogen.Components.Input as Input

type Query = InputQuery Int

component :: forall e. H.Component State Query (Aff (avar :: AVAR, dom :: DOM | e))
component = Input.mkComponent HP.InputNumber show parseInt
