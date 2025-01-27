module UI.Main where

import Prelude

import Effect (Effect)
import Halogen.Aff (awaitBody, runHalogenAff)
import Halogen.VDom.Driver (runUI)

import UI.Component.Counter (counter)

main :: Effect Unit
main = runHalogenAff do
    body <- awaitBody
    runUI counter unit body
