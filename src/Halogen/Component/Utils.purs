module Halogen.Component.Utils where

import Prelude

import Control.Monad.Aff (later', runAff)
import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Aff.Free (class Affable)
import Control.Monad.Eff.Class (liftEff)

import Data.Either as E
import Data.Int as Int
import Data.Time.Duration (Milliseconds(..))

import Halogen as H
import Halogen.Query.EventSource as ES

import Math as Math

sendAfter
  ∷ ∀ s f g eff
  . (Affable (avar ∷ AVAR | eff) g, Functor g)
  ⇒ Milliseconds
  → f Unit
  → H.ComponentDSL s f g Unit
sendAfter ms action =
  H.subscribe $ oneTimeEventSource ms action

sendAfter'
  ∷ ∀ s s' f f' g p eff
  . (Affable (avar ∷ AVAR | eff) g, Functor g)
  ⇒ Milliseconds
  → f Unit
  → H.ParentDSL s s' f f' g p Unit
sendAfter' ms action =
  H.subscribe' $ oneTimeEventSource ms action

raise
  ∷ ∀ s f g eff
  . (Affable (avar ∷ AVAR | eff) g, Functor g)
  ⇒ f Unit
  → H.ComponentDSL s f g Unit
raise = sendAfter (Milliseconds 0.0)

raise'
  ∷ ∀ s s' f f' g p eff
  . (Affable (avar ∷ AVAR | eff) g, Functor g)
  ⇒ f Unit
  → H.ParentDSL s s' f f' g p Unit
raise' = sendAfter' (Milliseconds 0.0)

oneTimeEventSource
  ∷ ∀ f g eff
  . (Affable (avar ∷ AVAR | eff) g, Functor g)
  ⇒ Milliseconds
  → f Unit
  → H.EventSource f g
oneTimeEventSource (Milliseconds n) action =
  ES.EventSource $
    ES.produce \emit →
      void $ runAff (const $ pure unit) (const $ pure unit)
        $ later' (Int.floor $ Math.max n zero)
        $ liftEff do
          emit $ E.Left action
          emit $ E.Right unit
