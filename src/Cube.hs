-- Cube.hs
module Cube where

-- Cube: a cube data structure, uses six faces to implement a cube
type Cube = (Face, Face, Face, Face, Face, Face)

-- Face: a face data structure, uses nine instances of color to implement a face
type Face = (Color, Color, Color, Color, Color, Color, Color, Color, Color)

-- Color: a color data structure, uses six colors to implement a color
data Color = W | Y | R | O | B | G
    deriving (Show, Eq, Ord)

-- isSolved: predicate to check if a cube is solved
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

-- solvedCube: a solved cube
solvedCube :: Cube
solvedCube = (
        (W,W,W,W,W,W,W,W,W), 
        (G,G,G,G,G,G,G,G,G),
        (R,R,R,R,R,R,R,R,R),
        (B,B,B,B,B,B,B,B,B),
        (O,O,O,O,O,O,O,O,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    )
