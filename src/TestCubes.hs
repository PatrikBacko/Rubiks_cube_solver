module TestCubes where

import Cube (Cube, Color(..), solved)
import Moves (u, u', d, d', l, l', r, r', f, f', b, b')

-- generateCube: generate a cube using a list of moves
generateCube :: [Cube -> Cube] -> Cube
generateCube moves = generateCube' solved moves
    where 
        generateCube' cube [] = cube
        generateCube' cube (move:moves) = generateCube' (move cube) moves

------------------------------------------------------------------------------------------------------------------------
-- Test cubes
------------------------------------------------------------------------------------------------------------------------

r1 :: Cube 
r1 = (
        (W,W,W,W,W,W,W,W,W),
        (R,R,R,G,G,G,G,G,G),
        (B,B,B,R,R,R,R,R,R),
        (O,O,O,B,B,B,B,B,B),
        (G,G,G,O,O,O,O,O,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    )

r2 :: Cube
r2 = (
        (W,W,W,W,W,W,W,W,W),
        (R,R,R,G,G,G,R,R,R),
        (B,B,B,R,R,R,B,B,B),
        (O,O,O,B,B,B,O,O,O),
        (G,G,G,O,O,O,G,G,G),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    )

r3 :: Cube
r3 = (
        (W,W,W,W,W,W,R,G,R),
        (R,R,Y,G,G,Y,R,R,Y),
        (B,R,B,B,R,B,B,R,B),
        (W,O,O,W,B,B,W,O,O),
        (G,G,G,O,O,O,G,G,G),
        (O,B,O,Y,Y,Y,Y,Y,Y)
    )

r4 :: Cube
r4 = (
        (W,W,W,W,W,W,Y,Y,Y),
        (R,R,O,G,G,B,R,R,O),
        (B,B,B,R,R,R,B,B,B),
        (R,O,O,G,B,B,R,O,O),
        (G,G,G,O,O,O,G,G,G),
        (W,W,W,Y,Y,Y,Y,Y,Y)
    )

r5 :: Cube
r5 = (
        (W,W,W,W,W,W,Y,Y,Y),
        (R,R,O,G,G,B,B,B,B),
        (B,B,B,R,R,R,R,O,O),
        (R,O,O,G,B,B,G,G,G),
        (G,G,G,O,O,O,R,R,O),
        (W,Y,Y,W,Y,Y,W,Y,Y)
    )

r6 :: Cube
r6 = (
        (O,W,W,O,W,W,G,Y,Y),
        (B,G,R,B,G,R,B,B,O),
        (W,B,B,W,R,R,Y,O,O),
        (R,O,O,G,B,B,G,G,G),
        (G,G,W,O,O,W,R,R,W),
        (B,Y,Y,R,Y,Y,R,Y,Y)
    )

r7 :: Cube
r7 = (
        (B,B,B,O,W,W,G,Y,Y),
        (R,G,R,Y,G,R,Y,B,O),
        (W,B,B,W,R,R,Y,O,O),
        (R,O,O,G,B,W,G,G,W),
        (W,W,W,G,O,R,G,O,R),
        (B,Y,Y,R,Y,Y,G,B,O)
    )

r8 :: Cube
r8 = (
        (Y,Y,R,O,W,W,G,Y,Y),
        (G,G,R,B,G,R,O,B,O),
        (W,B,B,W,R,R,Y,O,O),
        (R,O,B,G,B,B,G,G,B),
        (W,R,R,W,O,O,W,G,G),
        (B,Y,Y,R,Y,Y,W,W,O)
    )

r9 :: Cube
r9 = (
        (O,B,G,O,W,W,G,Y,Y),
        (W,G,R,W,G,R,O,B,O),
        (W,B,B,W,R,R,Y,O,O),
        (R,O,Y,G,B,Y,G,G,R),
        (R,O,G,R,O,G,W,W,W),
        (B,Y,Y,R,Y,Y,B,B,B)
    )

r10 :: Cube
r10 = (
        (W,B,G,G,W,W,G,Y,Y),
        (O,W,W,B,G,G,O,R,R),
        (O,B,B,O,R,R,G,O,O),
        (R,O,Y,G,B,Y,G,G,R),
        (R,O,B,R,O,R,W,W,B),
        (W,Y,Y,W,Y,Y,Y,B,B)
    )

r11 :: Cube
r11 = (
        (W,B,G,G,W,W,R,G,W),
        (O,W,W,B,G,Y,O,R,Y),
        (G,O,O,O,R,B,O,R,B),
        (G,O,Y,Y,B,Y,Y,G,R),
        (R,O,B,R,O,R,W,W,B),
        (G,G,R,W,Y,Y,Y,B,B)
    )

r12 :: Cube
r12 = (
        (W,B,O,G,W,B,R,G,B),
        (O,W,W,B,G,Y,O,R,Y),
        (G,O,R,O,R,Y,O,R,B),
        (Y,Y,G,G,B,O,R,Y,Y),
        (W,O,B,W,O,R,G,W,B),
        (G,G,W,W,Y,R,Y,B,R)
    )

r13 :: Cube 
r13 = (
        (W,B,R,G,W,Y,R,G,B),
        (O,W,W,B,G,Y,O,R,Y),
        (G,O,W,O,R,R,O,R,R),
        (R,G,Y,Y,B,Y,Y,O,G),
        (B,O,B,B,O,R,O,W,B),
        (G,G,G,W,Y,W,Y,B,W)
    )

r14 :: Cube
r14 = (
        (O,B,O,G,W,Y,R,G,B),
        (Y,W,W,B,G,Y,W,R,Y),
        (G,O,W,O,R,R,O,R,R),
        (R,G,W,Y,B,B,Y,O,R),
        (B,R,B,O,O,W,B,B,O),
        (G,G,G,W,Y,W,G,Y,Y)
    )


