module Human_approach where

import Bfs ( extractSolution, startBfs, State(..) ) 
import Cube ( Color(Y, W, G, R, B, O), Cube ) 
import Moves ( b, b', d, d', f, f', l, l', r, r', u, u', basicMoves )

--------------------------------------------------------------------------------
-- Human approach
--------------------------------------------------------------------------------

-- solveHuman: solve the cube using the human approach and return the solution (moves)
solveHuman :: Cube -> String
solveHuman cube = concat $ drop 1 $ reverse $ extractSolution stateFinal
    where
        state1 = solveHumanStage1 state
        state2 = solveHumanStage2 state1
        state3 = solveHumanStage3 state2
        stateFinal = solveHumanStage4 state3
        state = State cube Nill ""


-- test/debug function
solveHumanDebug :: Cube -> Cube
solveHumanDebug cube = finalCube
    where
        state1 = solveHumanStage1 state
        state2 = solveHumanStage2 state1
        state3 = solveHumanStage3 state2
        stateFinal@(State finalCube _ _) = solveHumanStage4 state3
        state = State cube Nill ""


-- solveHumanStage1: solve the first stage of the human approach
solveHumanStage1 :: State -> State
solveHumanStage1 state = stateFinal
    where
        state1 = startBfs state isHumanStage1v1 (basicMoves ++ humanMovesStage1)
        state2 = startBfs state1 isHumanStage1v2 (basicMoves ++ humanMovesStage1)
        state3 = startBfs state2 isHumanStage1v3 (basicMoves ++ humanMovesStage1)
        stateFinal = startBfs state3 isHumanStage1v4 (basicMoves ++ humanMovesStage1)

-- solveHumanStage2: solve the second stage of the human approach
solveHumanStage2 :: State -> State
solveHumanStage2 state = stateFinal
    where
        state1 = startBfs state isHumanStage2v1 humanMovesStage2
        state2 = startBfs state1 isHumanStage2v2 humanMovesStage2
        state3 = startBfs state2 isHumanStage2v3 humanMovesStage2
        stateFinal = startBfs state3 isHumanStage2v4 humanMovesStage2

-- solveHumanStage3: solve the third stage of the human approach
solveHumanStage3 :: State -> State
solveHumanStage3 state = stateFinal
    where
        state1 = startBfs state isHumanStage3v1 humanMovesStage3
        state2 = startBfs state1 isHumanStage3v2 humanMovesStage3
        state3 = startBfs state2 isHumanStage3v3 humanMovesStage3
        stateFinal = startBfs state3 isHumanStage3v4 humanMovesStage3

-- solveHumanStage4: solve the fourth stage of the human approach
solveHumanStage4 :: State -> State
solveHumanStage4 state = stateFinal
    where
        state1 = startBfs state isHumanStage4v1 humanMovesStage4v1
        state2 = startBfs state1 isHumanStage4v2 humanMovesStage4v2
        state3 = startBfs state2 isHumanStage4v3 humanMovesStage4v3
        stateFinal = startBfs state3 isHumanStage4v4 humanMovesStage4v4


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

-- whole cube done
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


--------------------------------------------------------------------------------
-- Human approach useful and more advanced moves for every stage
--------------------------------------------------------------------------------

humanMovesStage1 :: [(String, Cube -> Cube)]
humanMovesStage1 = [
            ("u u", u . u),
            ("d d", d . d),
            ("r r", r . r),
            ("l l", l . l),
            ("f f", f . f),
            ("b b", b . b),

            ("u' r u", u' . r . u),
            ("u r' u'", u . r' . u'),
            ("u' l u", u' . l . u),
            ("u l' u'", u . l' . u'),
            ("u' f u", u' . f . u),
            ("u f' u'", u . f' . u'),
            ("u b u'", u . b . u'),
            ("u' b' u", u' . b' . u)
        ]

humanMovesStage2 :: [(String, Cube -> Cube)]
humanMovesStage2 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("r' d r", r' . d . r),
            ("r' d' r", r' . d' . r),

            ("l d l'", l . d . l'),
            ("l d' l'", l . d' . l'),
            
            ("r d r'", r . d . r'),
            ("r d' r'", r . d' . r'),

            ("l' d l", l' . d . l),
            ("l' d' l", l' . d' . l),

            ("d' r d d r'", d' . r . d . d . r'),
            ("d l' d d l", d . l' . d . d . l),
            ("d r' d d r", d . r' . d . d . r),
            ("d' l d d l'", d' . l . d . d . l')
        ]
    
humanMovesStage3 :: [(String, Cube -> Cube)]
humanMovesStage3 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("f' d f d' r d' r'", f' . d . f . d' . r . d' . r'), 
            ("f d' f' d l' d l", f . d' . f' . d . l' . d . l),
            ("r d' r' d f' d f", r . d' . r' . d . f' . d . f),
            ("l' d l d' f d' f'", l' . d . l . d' . f . d' . f'),
            ("b' d' b d r' d r", b' . d' . b . d . r' . d . r),
            ("b d b' d' l d' l'", b . d . b' . d' . l . d' . l'),
            ("r' d r d' b' d' b", r' . d . r . d' . b' . d' . b),
            ("l d' l' d b d b'", l . d' . l' . d . b . d . b')
        ]

humanMovesStage4v1 :: [(String, Cube -> Cube)]
humanMovesStage4v1 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("f' d' l' d l f", f' . d' . l' . d . l . f),
            ("f' l' d' l d f", f' . l' . d' . l . d . f)
        ]

humanMovesStage4v2 :: [(String, Cube -> Cube)]
humanMovesStage4v2 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("r d l' d' r' d l", r . d . l' . d' . r' . d . l)
        ]

humanMovesStage4v3 :: [(String, Cube -> Cube)]
humanMovesStage4v3 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("f' l' d' l d l' d l l f l' d l' d' l", f' . l' . d' . l . d . l' . d . l . l . f . l' . d . l' . d' . l)
        ]

humanMovesStage4v4 :: [(String, Cube -> Cube)]
humanMovesStage4v4 = [
            ("d", d),
            ("d'", d'),
            ("d d", d . d),

            ("l' l' d l' d l d' l d' l d l", l' . l' . d . l' . d . l . d' . l . d' . l . d . l)
        ]
