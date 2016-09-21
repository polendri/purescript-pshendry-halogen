-- | A generic component for the <input> tag, designed to be specialized for
-- | different input types.
module PSHendry.Halogen.Components.Input where

import PSHendry.Prelude

import Control.Monad.Aff.AVar (AVAR)
import DOM (DOM)
import Halogen as H
import Halogen.Component.Utils (raise)
import Halogen.HTML (ClassName)
import Halogen.HTML.Indexed as HH
import Halogen.HTML.Events.Indexed as HE
import Halogen.HTML.Properties.Indexed as HP
import Utils.DOM (focus, select)

data InputQuery t a
  = GetValue (Maybe t -> a)
  | SetValue t a
  | ValueChange a
  | Focus a
  | ValueInput String a

type InputState t =
  { id :: String
  , classes :: Array ClassName
  , enabled :: Boolean
  , focused :: Boolean
  , tabIndex :: Int
  , value :: String
  }

mkComponent :: forall t e
   . HP.InputType
  -> (t -> String)
  -> (String -> Maybe t)
  -> H.Component (InputState t) (InputQuery t) (Aff (avar :: AVAR, dom :: DOM | e))
mkComponent inputType toStr fromStr = H.component { render, eval }
  where

  render :: (InputState t) -> H.ComponentHTML (InputQuery t)
  render state =
    HH.input
      [ HP.id_ state.id
      , HP.classes state.classes
      , HP.inputType inputType
      , HP.disabled (not state.enabled)
      , HP.tabIndex state.tabIndex
      , HP.value state.value
      , HE.onValueInput (HE.input ValueInput)
      ]

  eval :: (InputQuery t) ~> H.ComponentDSL (InputState t) (InputQuery t) (Aff (avar :: AVAR, dom :: DOM | e))
  eval (GetValue continue) = do
    value <- H.gets _.value
    pure $ continue $ fromStr value
  eval (SetValue v next) = do
    H.modify (_ { value = toStr v })
    raise $ H.action ValueChange
    pure next
  eval (ValueChange next) = do
    pure next
  eval (Focus next) = do
    id <- H.gets _.id
    H.fromEff do
      focus id
      select id
    pure next
  eval (ValueInput v next) = do
    H.modify (_ { value = v })
    raise $ H.action ValueChange
    pure next
