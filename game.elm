module Game where

import Table
import Deck

type alias Game =
  {
    table : Table.Table,
    deck : Deck.Deck
  }
