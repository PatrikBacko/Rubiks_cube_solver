-- Cube.hs
module Cube where

type Cube = (Face, Face, Face, Face, Face, Face)

type Face = (Tile, Tile, Tile, Tile, Tile, Tile, Tile, Tile, Tile)

type Tile = Color

data Color = W | Y | R | O | B | G
    deriving (Show, Eq, Ord)

isSolved :: Cube -> Bool
isSolved (
        (W,W,W,W,W,W,W,W,W), 
        (G,G,G,G,G,G,G,G,G),
        (R,R,R,R,R,R,R,R,R),
        (B,B,B,B,B,B,B,B,B),
        (O,O,O,O,O,O,O,O,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
        ) = True
isSolved _ = False

solvedCube :: Cube
solvedCube = (
        (W,W,W,W,W,W,W,W,W), 
        (G,G,G,G,G,G,G,G,G),
        (R,R,R,R,R,R,R,R,R),
        (B,B,B,B,B,B,B,B,B),
        (O,O,O,O,O,O,O,O,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    )

r1 :: Cube
r1 = (
        (W,W,W,W,W,W,Y,Y,Y),
        (R,R,O,G,G,B,R,R,O),
        (B,B,B,R,R,R,B,B,B),
        (R,O,O,G,B,B,R,O,O),
        (G,G,G,O,O,O,G,G,G),
        (W,W,W,Y,Y,Y,Y,Y,Y)
    )

r2 :: Cube
r2 = (
        (W,W,W,W,W,W,Y,Y,Y),
        (R,R,O,G,G,B,B,B,B),
        (B,B,B,R,R,R,R,O,O),
        (R,O,O,G,B,B,G,G,G),
        (G,G,G,O,O,O,R,R,O),
        (W,Y,Y,W,Y,Y,W,Y,Y)
    )
