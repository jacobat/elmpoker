module Deck where

import Random

type Rank = Ace | King | Queen | Jack | Ten | Nine | Eight | Seven | Six | Five | Four | Three | Two
type Suit = Spades | Clubs | Hearts | Diamonds

type alias Card = {
  suit : Suit,
  rank : Rank
}

type alias Deck = List Card

type alias RandomList a = List (a, Float)

suits : List Suit
suits = [ Spades, Clubs, Hearts, Diamonds ]

ranks : List Rank
ranks = [Ace, King, Queen, Jack, Ten, Nine, Eight, Seven, Six, Five, Four, Three, Two]

cartesianProduct : (a -> b -> c) -> List a -> List b -> List c
cartesianProduct generator xs ys =
  List.concatMap (\x -> List.map (generator x) ys) xs

fullDeck : List Card
fullDeck = cartesianProduct Card suits ranks

randomFloats : Int -> List Float
randomFloats seed =
  let
      listGenerator = Random.list 52 (Random.float 0 1)
      initialSeed = Random.initialSeed seed
  in
      fst(Random.generate listGenerator initialSeed)

generate : Int -> List Card
generate seed =
  let
      randomizedDeck = List.map2 (,) fullDeck (randomFloats seed)
  in
      randomizedDeck
        |> List.sortBy snd
        |> List.map fst
