-- Moves.hs
module Moves where

import Cube

--List of basic moves
basicMoves :: [(String ,Cube -> Cube)]
basicMoves = [
    ("u", u), 
    ("d", d), 
    ("l", l),
    ("r", r), 
    ("f", f), 
    ("b", b), 
    ("u'", u'), 
    ("d'", d'), 
    ("l'", l'), 
    ("r'", r'), 
    ("f'", f'), 
    ("b'", b')
    ]


----------------------------------------------------------------------------------------------------------------------------------------
-- Basic moves definitions
----------------------------------------------------------------------------------------------------------------------------------------

-- clockwise up
u :: Cube -> Cube
u  (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9),
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6
    ) =
    (
        (w7, w4, w1, w8, w5, w2, w9, w6, w3),
        (r1, r2, r3, g4, g5, g6, g7, g8, g9), 
        (b1, b2, b3, r4, r5, r6, r7, r8, r9), 
        (o1, o2, o3, b4, b5, b6, b7, b8, b9), 
        (g1, g2, g3, o4, o5, o6, o7, o8, o9), 
        f6
    )

-- clockwise down
d :: Cube -> Cube
d (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) =
    (
        f1, 
        (g1, g2, g3, g4, g5, g6, r7, r8, r9), 
        (r1, r2, r3, r4, r5, r6, b7, b8, b9), 
        (b1, b2, b3, b4, b5, b6, o7, o8, o9), 
        (o1, o2, o3, o4, o5, o6, g7, g8, g9), 
        (y3, y6, y9, y2, y5, y8, y1, y4, y7)
    )

-- clockwise left
l :: Cube -> Cube
l (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9),
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (o9, w2, w3, o6, w5, w6, o3, w8, w9), 
        (g7, g4, g1, g8, g5, g2, g9, g6, g3),  
        (w1, r2, r3, w4, r5, r6, w7, r8, r9), 
        f4, 
        (o1, o2, y7, o4, o5, y4, o7, o8, y1), 
        (r1, y2, y3, r4, y5, y6, r7, y8, y9)
    )

-- clockwise right
r :: Cube -> Cube
r (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) =
    (
        (w1, w2, r3, w4, w5, r6, w7, w8, r9), 
        f2, 
        (r1, r2, y3, r4, r5, y6, r7, r8, y9), 
        (b7, b4, b1, b8, b5, b2, b9, b6, b3), 
        (w9, o2, o3, w6, o5, o6, w3, o8, o9), 
        (y1, y2, o7, y4, y5, o4, y7, y8, o1)
    )

-- clockwise front
f :: Cube -> Cube
f (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, g9, g6, g3), 
        (g1, g2, y1, g4, g5, y2, g7, g8, y3), 
        (r7, r4, r1, r8, r5, r2, r9, r6, r3),  
        (w7, b2, b3, w8, b5, b6, w9, b8, b9), 
        f5, 
        (b7, b4, b1, y4, y5, y6, y7, y8, y9)
    )

-- clockwise back
b :: Cube -> Cube
b (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        (o1, o2, o3, o4, o5, o6, o7, o8, o9),  
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (g7, g4, g1, w4, w5, w6, w7, w8, w9), 
        (y7, g2, g3, y8, g5, g6, y9, g8, g9), 
        f3, 
        (b1, b2, w1, b4, b5, w2, b7, b8, w3),
        (o3, o6, o9, o2, o5, o8, o1, o4, o7),
        (y1, y2, y3, y4, y5, y6, b9, b6, b3)
    )

-- counter-clockwise up
u' :: Cube -> Cube
u'  (
        (w7, w4, w1, w8, w5, w2, w9, w6, w3),
        (r1, r2, r3, g4, g5, g6, g7, g8, g9), 
        (b1, b2, b3, r4, r5, r6, r7, r8, r9), 
        (o1, o2, o3, b4, b5, b6, b7, b8, b9), 
        (g1, g2, g3, o4, o5, o6, o7, o8, o9), 
        f6
    ) =
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        f6
    )

-- counter-clockwise down
d' :: Cube -> Cube
d' (
        f1, 
        (g1, g2, g3, g4, g5, g6, r7, r8, r9), 
        (r1, r2, r3, r4, r5, r6, b7, b8, b9), 
        (b1, b2, b3, b4, b5, b6, o7, o8, o9), 
        (o1, o2, o3, o4, o5, o6, g7, g8, g9), 
        (y3, y6, y9, y2, y5, y8, y1, y4, y7)
    ) =
    (
        f1, 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

-- counter-clockwise left
l' :: Cube -> Cube
l' (
        (o9, w2, w3, o6, w5, w6, o3, w8, w9), 
        (g7, g4, g1, g8, g5, g2, g9, g6, g3),  
        (w1, r2, r3, w4, r5, r6, w7, r8, r9), 
        f4, 
        (o1, o2, y7, o4, o5, y4, o7, o8, y1), 
        (r1, y2, y3, r4, y5, y6, r7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9),
        (r1, r2, r3, r4, r5, r6, r7, r8, r9), 
        f4, 
        (o1, o2, o3, o4, o5, o6, o7, o8, o9), 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

-- counter-clockwise right
r' :: Cube -> Cube
r' (
        (w1, w2, r3, w4, w5, r6, w7, w8, r9), 
        f2, 
        (r1, r2, y3, r4, r5, y6, r7, r8, y9), 
        (b7, b4, b1, b8, b5, b2, b9, b6, b3), 
        (w9, o2, o3, w6, o5, o6, w3, o8, o9), 
        (y1, y2, o7, y4, y5, o4, y7, y8, o1)
    ) =
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        f2, 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9),
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        (o1, o2, o3, o4, o5, o6, o7, o8, o9),
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

-- counter-clockwise front
f' :: Cube -> Cube
f' (
        (w1, w2, w3, w4, w5, w6, g9, g6, g3), 
        (g1, g2, y1, g4, g5, y2, g7, g8, y3), 
        (r7, r4, r1, r8, r5, r2, r9, r6, r3),  
        (w7, b2, b3, w8, b5, b6, w9, b8, b9), 
        f5, 
        (b7, b4, b1, y4, y5, y6, y7, y8, y9)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        (r1, r2, r3, r4, r5, r6, r7, r8, r9),
        (b1, b2, b3, b4, b5, b6, b7, b8, b9), 
        f5, 
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )

-- counter-clockwise back
b' :: Cube -> Cube
b' (
        (g7, g4, g1, w4, w5, w6, w7, w8, w9), 
        (y7, g2, g3, y8, g5, g6, y9, g8, g9), 
        f3, 
        (b1, b2, w1, b4, b5, w2, b7, b8, w3),
        (o3, o6, o9, o2, o5, o8, o1, o4, o7),
        (y1, y2, y3, y4, y5, y6, b9, b6, b3)
    ) = 
    (
        (w1, w2, w3, w4, w5, w6, w7, w8, w9), 
        (g1, g2, g3, g4, g5, g6, g7, g8, g9), 
        f3, 
        (b1, b2, b3, b4, b5, b6, b7, b8, b9),
        (o1, o2, o3, o4, o5, o6, o7, o8, o9),
        (y1, y2, y3, y4, y5, y6, y7, y8, y9)
    )