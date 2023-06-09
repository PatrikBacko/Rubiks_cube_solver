module Bfs where

import Cube ( isSolved, Cube )
import Moves ( basicMoves )
import qualified Data.Set as Set
import Queue ( dequeue, enqueueList, singleton, Queue )

-- State: Cube, Parent, Move, used to reconstruct the solution
data State = State Cube State String | Nill

-- applyMoves: apply all chosen moves to a cube
applyMoves :: Cube -> [(String ,Cube -> Cube)] ->[(Cube, String)]
applyMoves cube moves = map (\(name,move) -> (move cube, name)) moves   

-- bfs: breadth first search
bfs ::  Set.Set Cube -> Queue State -> (Cube -> Bool) -> [(String ,Cube -> Cube)] -> State
bfs seen queue isGoal moves
    | isGoal cube = state
    | otherwise = bfs newSeen newQueue isGoal moves
        where
            (state@(State cube _ _), qs) = dequeue queue
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube moves)
            newSeen = seen `Set.union` Set.fromList (map fst newMoves)
            newQueue = enqueueList (map (\(cube, name) -> State cube state name) newMoves) qs

-- startBfs: start the breadth first search
startBfs :: State -> (Cube -> Bool) -> [(String ,Cube -> Cube)] -> State
startBfs state = bfs Set.empty (singleton state)

-- extractSolution: extract the solution (moves) from the state that bfs returns
extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:" ":extractSolution state

-- solveBfs: solve the cube using breadth first search and return the solution (moves)
solveBfs :: Cube -> String
solveBfs cube = concat $ drop 1 $ reverse $ extractSolution (startBfs (State cube Nill "") isSolved basicMoves)
