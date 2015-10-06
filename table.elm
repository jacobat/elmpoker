module Table where

import Array exposing (Array)

type alias Money = Int

type alias Player = {
  name : String,
  stack : Money,
  uuid : String
}

type alias Seat = Maybe Player

type alias Table = {
  seats : Array Seat,
  pot : Int
}

newTable : Int -> Table
newTable seatCount =
  Table (Array.repeat seatCount Nothing) 0

availableSeatIndex table =
  let
      list = Array.toIndexedList table.seats
      availableSeats = List.filter (\(index, seat) -> seat == Nothing) list
      firstSeat = List.head availableSeats
  in
      case firstSeat of
        Nothing -> Nothing
        Just (index, _) -> Just index

join : Table -> Player -> Table
join table player =
  case availableSeatIndex table of
    Nothing -> table
    Just index -> { table | seats <- Array.set index (Just player) table.seats }
