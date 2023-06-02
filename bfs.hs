module Bfs where

import Cube ( Cube, solved )
import Moves ( moves )
import qualified Data.Set as Set
-- import qualified Data.Sequence as Seq

data State = State Cube State String | Nill

applyMoves :: Cube -> [(Cube, String)]
applyMoves cube = map (\(name,move) -> (move cube, name)) moves

bfs :: Cube -> Set.Set Cube -> [State] -> State
bfs goal seen (state@(State cube _ _):qs)
    | cube == goal = state
    | otherwise = bfs goal newSeen newQueue
        where
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube)
            newSeen = Set.union seen (Set.fromList (map fst newMoves))
            newQueue = qs ++ map (\(cube, name) -> State cube state name) newMoves

extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:extractSolution state

solveBfs :: Cube -> [String]
solveBfs cube = reverse $ extractSolution (bfs solved Set.empty [State cube Nill ""])