module Delayed where

import Graphics.Element exposing (show)
import EventSignal exposing (eventSignal)

events = [ 1, 2, 3, 4, 5, 6, 7, 8 ]

view event =
  case event of
    Just x -> toString x
    Nothing -> "Boom"

main = Signal.map (\e -> (show (view e))) (eventSignal (List.reverse events))
