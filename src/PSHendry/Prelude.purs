module PSHendry.Prelude
  ( unsafeFromJust
  , unsafeFromRight
  , module Prelude
  , module Control.Apply
  , module Control.Monad.Aff
  , module Control.Monad.Eff
  , module Control.Monad.Eff.Class
  , module Control.Monad.Eff.Console
  , module Data.Array
  , module Data.Array.Partial
  , module Data.Const
  , module Data.Either
  , module Data.Functor.Coproduct
  , module Data.Maybe
  , module Data.Traversable
  , module Data.Tuple
  , module Data.Void
  , module Partial.Unsafe
  ) where

import Prelude
import Control.Apply (lift2, lift3, lift4, lift5)
import Control.Monad.Aff (Aff)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Class (liftEff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Data.Array ((!!), elemIndex, filter, length, mapWithIndex, zip)
import Data.Array.Partial (head, tail, unsafeIndex)
import Data.Const (Const(..), getConst)
import Data.Either (Either(..), either, fromLeft, fromRight, isLeft, isRight)
import Data.Functor.Coproduct (Coproduct, coproduct, unCoproduct, left, right)
import Data.Maybe (Maybe(..), fromJust, isJust, isNothing, maybe)
import Data.Traversable (class Traversable, traverse, sequence)
import Data.Tuple (Tuple(..), curry, fst, snd, uncurry)
import Data.Void (Void, absurd)
import Partial.Unsafe (unsafePartial)
import Unsafe.Coerce (unsafeCoerce)

undefined :: forall a. a
undefined = unsafeCoerce unit

unsafeFromJust :: forall a. Maybe a -> a
unsafeFromJust = unsafePartial fromJust

unsafeFromRight :: forall a b. Either a b -> b
unsafeFromRight = unsafePartial fromRight
