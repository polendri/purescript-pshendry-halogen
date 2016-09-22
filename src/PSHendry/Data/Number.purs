module PSHendry.Data.Number
  ( parseNumber
  , toFixed
  , toPrecision
  ) where

import PSHendry.Prelude
import Global (isNaN, readFloat)

parseNumber :: String -> Maybe Number
parseNumber s = if isNaN num then Nothing else Just num
  where
  num = readFloat s

foreign import toFixed :: Int -> Number -> String
foreign import toPrecision :: Int -> Number -> String
