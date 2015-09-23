module Table where

import Deck exposing (Deck)

type alias Money = Int

type alias Player = {
  name : String,
  stack : Money
}

type alias Seat = Maybe Player

type alias Table = {
  seats : List Seat,
  pot : Int
}

type alias Game = {
  deck : Deck
}
