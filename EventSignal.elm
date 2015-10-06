module EventSignal where

import Time exposing (every, second)

-- eventSignal : (a -> m -> m) -> e -> Signal e
update action events =
  Maybe.withDefault [] (List.tail events)

eventSignalFold events = Signal.foldp update events (every second)

eventSignal events = Signal.map List.head (eventSignalFold events)

