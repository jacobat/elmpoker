module Game where

import Graphics.Element exposing (show)
import Table exposing (Table)
import Deck exposing (Deck)
import EventSignal exposing (eventSignal)

type alias Game =
  {
    table : Table,
    deck : Deck
  }

type Event = Join Table.Player | StartGame | None

update : Event -> Game -> Game
update event game =
  case event of
    None -> game
    StartGame -> game
    Join player ->
      { game | table <- Table.join game.table player }


player1 = { name = "Jacob", stack = 100, uuid = "jacob" }
player2 = { name = "Pia", stack = 100, uuid = "pia" }
player3 = { name = "Elise", stack = 100, uuid = "elise" }

initialGame : Game
initialGame = { table = Table.newTable 6, deck = Deck.generate 0 }

events : List Event
events = [ None, Join player1, Join player2 ]

gameSignal : Signal Game
gameSignal =
  let
      signal = Signal.map (Maybe.withDefault None) (eventSignal events)
  in
      Signal.foldp update initialGame signal

main = Signal.map show gameSignal
