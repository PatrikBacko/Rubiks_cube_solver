module Bfs where

import Cube
import Moves
import qualified Data.Set as Set
import Queue

data State = State Cube State String | Nill

applyMoves :: Cube -> [(String ,Cube -> Cube)] ->[(Cube, String)]
applyMoves cube moves = map (\(name,move) -> (move cube, name)) moves

bfs :: Cube -> Set.Set Cube -> Queue State -> [(String ,Cube -> Cube)] ->State
bfs goal seen queue moves
    | cube == goal = state
    | otherwise = bfs goal newSeen newQueue moves
        where
            (state@(State cube _ _), qs) = dequeue queue
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube moves)
            newSeen = Set.union seen (Set.fromList (map fst newMoves))
            newQueue = enqueueList (map (\(cube, name) -> State cube state name) newMoves) qs

extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:extractSolution state

solveBfs :: Cube -> [String]
solveBfs cube = reverse $ extractSolution (bfs solved Set.empty (singleton (State cube Nill "")) basicMoves)