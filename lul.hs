module Bfs where
import Cube
import Moves
import qualified Data.Set as Set
import qualified Data.Sequence as Seq

data State = State Cube State String | Nill

applyMoves :: Cube -> [(Cube, String)]
applyMoves cube = map (\(name,move) -> (move cube, name)) basicMoves

bfs :: (Cube -> Bool) -> Set.Set Cube -> Seq.Seq State -> State
bfs isGoal seen queue
    | isGoal cube = state
    | otherwise = bfs isGoal newSeen newQueue
        where
            state@(State cube _ _) = Seq.index queue 0 
            qs = Seq.drop 1 queue 
            newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube)
            newSeen = Set.union seen (Set.fromList (map fst newMoves))
            newQueue = qs Seq.>< Seq.fromList(map (\(cube, name) -> State cube state name) newMoves)

extractSolution :: State -> [String]
extractSolution (State _ Nill move) = []
extractSolution (State _ state move) = move:extractSolution state

solveBfs :: Cube -> [String]
solveBfs cube = reverse $ extractSolution (bfs isSolved Set.empty (Seq.singleton (State cube Nill "")))



--------------------------------------------------------------------------------------------------------------------------------------

-- module Bfs where

-- import Cube
-- import Moves
-- import qualified Data.Set as Set

-- data State = State Cube State String | Nill

-- applyMoves :: Cube -> [(Cube, String)]
-- applyMoves cube = map (\(name,move) -> (move cube, name)) basicMoves

-- bfs :: (Cube -> Bool) -> Set.Set Cube -> [State] -> State
-- bfs isGoal seen (state@(State cube _ _):qs)
--     | isGoal cube = state
--     | otherwise = bfs isGoal newSeen newQueue
--         where
--             newMoves = filter (\(cube, name) -> not (Set.member cube seen)) (applyMoves cube)
--             newSeen = Set.union seen (Set.fromList (map fst newMoves))
--             newQueue = qs ++ map (\(cube, name) -> State cube state name) newMoves

-- extractSolution :: State -> [String]
-- extractSolution (State _ Nill move) = []
-- extractSolution (State _ state move) = move:extractSolution state

-- solveBfs :: Cube -> [String]
-- solveBfs cube = reverse $ extractSolution (bfs isSolved Set.empty [State cube Nill ""])