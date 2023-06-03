module Bfs where

import Cube
import Moves
import qualified Data.Set as Set
import Queue

data State = State Cube State String | Nill

applyMoves :: Cube -> [(String ,Cube -> Cube)] ->[(Cube, String)]
applyMoves cube moves = map (\(name,move) -> (move cube, name)) moves   

bfs :: (Cube -> Bool) -> Set.Set Cube -> Queue State -> [(String ,Cube -> Cube)] -> State
bfs isGoal seen queue moves
    | isGoal cube = state
    | otherwise = bfs isGoal newSeen newQueue moves
        where
            (state@(State cube _ _), qs) = dequeue queue
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube moves)
            newSeen = Set.union seen (Set.fromList (map fst newMoves))
            newQueue = enqueueList (map (\(cube, name) -> State cube state name) newMoves) qs

startBfs :: (Cube -> Bool) -> State -> [(String ,Cube -> Cube)] -> State
startBfs isGoal state = bfs isGoal Set.empty (singleton state)

extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:" ":extractSolution state

solveBfs :: Cube -> String
solveBfs cube = concat $ drop 1 $ reverse $ extractSolution (bfs isSolved Set.empty (singleton (State cube Nill "")) basicMoves)
