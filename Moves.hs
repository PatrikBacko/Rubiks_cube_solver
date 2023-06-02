-- Moves.hs
module Moves where

import Cube

-- moves :: [(String ,Cube -> Cube)]
-- moves = [
--     ("up", up), 
--     ("down", down), 
--     ("left", left), 
--     ("right", right), 
--     ("front", front), 
--     ("back", back), 
--     ("up'", up'), 
--     ("down'", down'), 
--     ("left'", left'), 
--     ("right'", right'), 
--     ("front'", front'), 
--     ("back'", back')
--     ]

-- maybe pridať datastructure Move, ktorá bude obsahovať názov a funkciu
moves :: [(String ,Cube -> Cube)]
moves = [
    ("up", up), 
    ("down", down), 
    ("left", left), 
    ("right", right), 
    ("front", front), 
    ("back", back), 
    ("C-up", up'), 
    ("C-down'", down'), 
    ("C-left'", left'), 
    ("C-right'", right'), 
    ("C-front'", front'), 
    ("C-back'", back')
    ]

--Clockwise moves of the cube
up :: Cube -> Cube
up  (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6
    ) =
    (
        f1, 
        (r1, r2, r3, g4, g5, g6, g7, g8, g9), 
        (b1, b2, b3, r4, r5, r6, r7, r8, r9), 
        (o1, o2, o3, b4, b5, b6, b7, b8, b9), 
        (g1, g2, g3, o4, o5, o6, o7, o8, o9), 
        f6
    )

down :: Cube -> Cube
down (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6
    ) =
    (
        f1, 
        (g1, g2, g3, g4, g5, g6, r7, r8, r9), 
        (r1, r2, r3, r4, r5, r6, b7, b8, b9), 
        (b1, b2, b3, b4, b5, b6, o7, o8, o9), 
        (o1, o2, o3, o4, o5, o6, g7, g8, g9), 
        f6
    )

left :: Cube -> Cube
left (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (o9, w2, w3, o6, w5, w6, o3, w8, w9), 
        f2, 
        (w1, r2, r3, w4, r5, r6, w7, r8, r9), 
        f4, 
        (o1, o2, y7, o4, o5, y4, o7, o8, y1), 
        (r1, y2, y3, r4, y5, y6, r7, y8, y9)
        )

right :: Cube -> Cube
right (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) =
    (
        (w1, w2, r3, w4, w5, r6, w7, w8, r9), 
        f2, 
        (r1, r2, y3, r4, r5, y6, r7, r8, y9), 
        f4, 
        (w9, o2, o3, w6, o5, o6, w3, o8, o9), 
        (y1, y2, o7, y4, y5, o4, y7, y8, o1)
    )

front :: Cube -> Cube
front (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, g9, g6, g3), 
        (g1, g2, y1, g4, g5, y2, g7, g8, y3), 
        f3, 
        (w7, b2, b3, w8, b5, b6, w9, b8, b9), 
        f5, 
        (b7, b4, b1, y4, y5, y6, y7, y8, y9)
    )
back :: Cube -> Cube
back (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (g7, g4, g1, w4, w5, w6, w7, w8, w9), 
        (y7, g2, g3, y8, g5, g6, y9, g8, g9), 
        f3, 
        (b1, b2, w1, b4, b5, w2, b7, b8, w3),
        f5, 
        (y1, y2, y3, y4, y5, y6, b9, b6, b3)
    )

--Counter-clockwise moves of the cube
up' :: Cube -> Cube
up'  (
        f1, 
        (r1, r2, r3, g4, g5, g6, g7, g8, g9), 
        (b1, b2, b3, r4, r5, r6, r7, r8, r9), 
        (o1, o2, o3, b4, b5, b6, b7, b8, b9), 
        (g1, g2, g3, o4, o5, o6, o7, o8, o9), 
        f6
    ) =
    (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6
    )

down' :: Cube -> Cube
down' (
        f1, 
        (g1, g2, g3, g4, g5, g6, r7, r8, r9), 
        (r1, r2, r3, r4, r5, r6, b7, b8, b9), 
        (b1, b2, b3, b4, b5, b6, o7, o8, o9), 
        (o1, o2, o3, o4, o5, o6, g7, g8, g9), 
        f6
    ) =
    (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6

    )

left' :: Cube -> Cube
left' (
        (o9, w2, w3, o6, w5, w6, o3, w8, w9), 
        f2, 
        (w1, r2, r3, w4, r5, r6, w7, r8, r9), 
        f4, 
        (o1, o2, y7, o4, o5, y4, o7, o8, y1), 
        (r1, y2, y3, r4, y5, y6, r7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

right' :: Cube -> Cube
right' (
        (w1, w2, r3, w4, w5, r6, w7, w8, r9), 
        f2, 
        (r1, r2, y3, r4, r5, y6, r7, r8, y9), 
        f4, 
        (w9, o2, o3, w6, o5, o6, w3, o8, o9), 
        (y1, y2, o7, y4, y5, o4, y7, y8, o1)
    ) =
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

front' :: Cube -> Cube
front' (
        (w1, w2, w3, w4, w5, w6, g9, g6, g3), 
        (g1, g2, y1, g4, g5, y2, g7, g8, y3), 
        f3, 
        (w7, b2, b3, w8, b5, b6, w9, b8, b9), 
        f5, 
        (b7, b4, b1, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )
back' :: Cube -> Cube
back' (
        (g7, g4, g1, w4, w5, w6, w7, w8, w9), 
        (y7, g2, g3, y8, g5, g6, y9, g8, g9), 
        f3, 
        (b1, b2, w1, b4, b5, w2, b7, b8, w3),
        f5, 
        (y1, y2, y3, y4, y5, y6, b9, b6, b3)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )