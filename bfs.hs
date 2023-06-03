module Bfs where

import Cube
import Moves
import qualified Data.Set as Set
import Queue

data State = State Cube State String | Nill

applyMoves :: Cube -> [(String ,Cube -> Cube)] ->[(Cube, String)]
applyMoves cube moves = map (\(name,move) -> (move cube, name)) moves   

bfs ::  Set.Set Cube -> Queue State -> (Cube -> Bool) -> [(String ,Cube -> Cube)] -> State
bfs seen queue isGoal moves
    | isGoal cube = state
    | otherwise = bfs newSeen newQueue isGoal moves
        where
            (state@(State cube _ _), qs) = dequeue queue
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube moves)
            newSeen = Set.union seen (Set.fromList (map fst newMoves))
            newQueue = enqueueList (map (\(cube, name) -> State cube state name) newMoves) qs

startBfs :: State -> (Cube -> Bool) -> [(String ,Cube -> Cube)] -> State
startBfs state = bfs Set.empty (singleton state)

extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:" ":extractSolution state

solveBfs :: Cube -> String
solveBfs cube = concat $ drop 1 $ reverse $ extractSolution (startBfs (State cube Nill "") isSolved basicMoves)
