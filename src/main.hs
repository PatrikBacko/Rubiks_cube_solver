import Bfs ( solveBfs )
import Cube ( solved )
import Human_approach ( solveHuman, solveHumanDebug )
import Moves ( u, u', d, d', l, l', r, r', f, f', b, b' )
import TestCubes (generateCube, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14)


------------------------------------------------------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------------------------------------------------------

-- How to run:
--      - open terminal in in folder src
--      - using ghci load main.hs
--      - now you can run the following functions:
--          - solveBfs <Cube> : Bfs approach to solve the cube, returns the moves
--          - solveHuman <Cube> : Human approach to solve the cube, returns the moves

-- Cube:
--      - solved : the solved cube
--      - Test cubes:
--          - r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14
--      - Generate a cube:
--          - generateCube <list of moves> : generates a cube using a list of moves applied on the solved cube

-- Example:
--      - solveBfs r1
--      - solveHuman r1
--      - solveHuman (generateCube [u, d', l, l, r, r', f, r, r, d', f, u'])