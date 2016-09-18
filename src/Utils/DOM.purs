module Utils.DOM where

import Prelude
import Control.Monad.Eff (Eff)
import DOM (DOM)

foreign import blur :: forall e. String -> Eff (dom :: DOM | e) Unit
foreign import focus :: forall e. String -> Eff (dom :: DOM | e) Unit
foreign import select :: forall e. String -> Eff (dom :: DOM | e) Unit
