module Main where

import Graphics.Element exposing (Element, show, croppedImage)
import Graphics.Collage exposing (collage, toForm, scale, moveX)

cardSize = ((2925 // 13), (1260 // 4))

aceOfHearts = croppedImage (0, 0) (fst cardSize) (snd cardSize) "deck.jpg"

aceOfHeartsForm = scale 0.3 (toForm aceOfHearts)

aceOfHeartsCollage = collage (fst cardSize) (snd cardSize) [aceOfHeartsForm, (moveX 70 aceOfHeartsForm)]

main : Element
main = aceOfHeartsCollage
