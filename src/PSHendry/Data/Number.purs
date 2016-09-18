module PSHendry.Data.Number
  ( parseNumber
  , toPrecision
  ) where

import PSHendry.Prelude
import Global (isNaN, readFloat)

parseNumber :: String -> Maybe Number
parseNumber s = if isNaN num then Nothing else Just num
  where
  num = readFloat s

foreign import toPrecision :: Int -> Number -> String
