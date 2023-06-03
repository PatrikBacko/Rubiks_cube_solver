import Bfs
import Cube
import Moves
import qualified Data.Set as Set


--------------------------------------------------------------------------------
--Human approach useful moves
--------------------------------------------------------------------------------

-- moves stage 1
-- humanStage1Moves :: [(String, Cube -> Cube)]
-- humanStage1Moves = [

--     ]






solveHumanStage1 :: State -> State
solveHumanStage1 state = bfs Set.empty (state) basicMoves













--------------------------------------------------------------------------------
-- Human appproach stage 1 - white cross 
--------------------------------------------------------------------------------

-- white-orange edge is correctly placed
isHumanStage1v1 :: Cube -> Bool
isHumanStage1v1 (
        (_,W,_,_,W,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,O,_,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage1v1 _ = False

-- white-green edge is correctly placed (+ previous)
isHumanStage1v2 :: Cube -> Bool
isHumanStage1v2 (
        (_,W,_,W,W,_,_,_,_),
        (_,G,_,_,G,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,O,_,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage1v2 _ = False

-- white-blue edge is correctly placed (+ previous)
isHumanStage1v3 :: Cube -> Bool
isHumanStage1v3 (
        (_,W,_,W,W,W,_,_,_),
        (_,G,_,_,G,_,_,_,_),
        (_,_,_,_,_,_,_,_,_),
        (_,B,_,_,B,_,_,_,_),
        (_,O,_,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage1v3 _ = False

-- white-red edge is correctly placed (+ previous)
isHumanStage1v4 :: Cube -> Bool
isHumanStage1v4 (
        (_,W,_,W,W,W,_,W,_),
        (_,G,_,_,G,_,_,_,_),
        (_,R,_,_,R,_,_,_,_),
        (_,B,_,_,B,_,_,_,_),
        (_,O,_,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage1v4 _ = False


--------------------------------------------------------------------------------
-- Human approach stage 2 - white corners and first layer
--------------------------------------------------------------------------------

-- white-orange-green corner is correctly placed (+ previous)
isHumanStage2v1 :: Cube -> Bool
isHumanStage2v1 (
        (W,W,_,W,W,W,_,W,_),
        (G,G,_,_,G,_,_,_,_),
        (_,R,_,_,R,_,_,_,_),
        (_,B,_,_,B,_,_,_,_),
        (_,O,O,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage2v1 _ = False

-- white-orange-blue corner is correctly placed (+ previous)
isHumanStage2v2 :: Cube -> Bool
isHumanStage2v2 (
        (W,W,W,W,W,W,_,W,_),
        (G,G,_,_,G,_,_,_,_),
        (_,R,_,_,R,_,_,_,_),
        (_,B,B,_,B,_,_,_,_),
        (O,O,O,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage2v2 _ = False

-- white-red-blue corner is correctly placed (+ previous)
isHumanStage2v3 :: Cube -> Bool
isHumanStage2v3 (
        (W,W,W,W,W,W,_,W,W),
        (G,G,_,_,G,_,_,_,_),
        (_,R,R,_,R,_,_,_,_),
        (B,B,B,_,B,_,_,_,_),
        (O,O,O,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage2v3 _ = False

-- white-red-green corner is correctly placed (+ previous)
isHumanStage2v4 :: Cube -> Bool
isHumanStage2v4 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,_,G,_,_,_,_),
        (R,R,R,_,R,_,_,_,_),
        (B,B,B,_,B,_,_,_,_),
        (O,O,O,_,O,_,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage2v4 _ = False


--------------------------------------------------------------------------------
-- Human approach stage 3 - second layer
--------------------------------------------------------------------------------

-- orange-green edge is correctly placed (+ previous)
isHumanStage3v1 :: Cube -> Bool
isHumanStage3v1 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,_,_,_,_),
        (R,R,R,_,R,_,_,_,_),
        (B,B,B,_,B,_,_,_,_),
        (O,O,O,_,O,O,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage3v1 _ = False

-- orange-blue edge is correctly placed (+ previous)
isHumanStage3v2 :: Cube -> Bool
isHumanStage3v2 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,_,_,_,_),
        (R,R,R,_,R,_,_,_,_),
        (B,B,B,_,B,B,_,_,_),
        (O,O,O,O,O,O,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage3v2 _ = False

-- red-blue edge is correctly placed (+ previous)
isHumanStage3v3 :: Cube -> Bool
isHumanStage3v3 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,_,_,_,_),
        (R,R,R,_,R,R,_,_,_),
        (B,B,B,B,B,B,_,_,_),
        (O,O,O,O,O,O,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage3v3 _ = False

-- red-green edge is correctly placed (+ previous)
isHumanStage3v4 :: Cube -> Bool
isHumanStage3v4 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,G,_,_,_),
        (R,R,R,R,R,R,_,_,_),
        (B,B,B,B,B,B,_,_,_),
        (O,O,O,O,O,O,_,_,_),
        (_,_,_,_,_,_,_,_,_)
    ) = True
isHumanStage3v4 _ = False

--------------------------------------------------------------------------------
-- Human approach stage 4 - whole cube
--------------------------------------------------------------------------------

-- yellow cross (+ previous)
isHumanStage4v1 :: Cube -> Bool
isHumanStage4v1 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,G,_,_,_),
        (R,R,R,R,R,R,_,_,_),
        (B,B,B,B,B,B,_,_,_),
        (O,O,O,O,O,O,_,_,_),
        (_,Y,_,Y,_,Y,_,Y,_)
    ) = True
isHumanStage4v1 _ = False

-- yellow face (+ previous)
isHumanStage4v2 :: Cube -> Bool
isHumanStage4v2 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,G,_,_,_),
        (R,R,R,R,R,R,_,_,_),
        (B,B,B,B,B,B,_,_,_),
        (O,O,O,O,O,O,_,_,_),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    ) = True
isHumanStage4v2 _ = False

-- yellow corners (+ previous)
isHumanStage4v3 :: Cube -> Bool
isHumanStage4v3 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,G,G,_,G),
        (R,R,R,R,R,R,R,_,R),
        (B,B,B,B,B,B,B,_,B),
        (O,O,O,O,O,O,O,_,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    ) = True
isHumanStage4v3 _ = False

-- whole cube
isHumanStage4v4 :: Cube -> Bool
isHumanStage4v4 (
        (W,W,W,W,W,W,W,W,W),
        (G,G,G,G,G,G,G,G,G),
        (R,R,R,R,R,R,R,R,R),
        (B,B,B,B,B,B,B,B,B),
        (O,O,O,O,O,O,O,O,O),
        (Y,Y,Y,Y,Y,Y,Y,Y,Y)
    ) = True
isHumanStage4v4 _ = False

