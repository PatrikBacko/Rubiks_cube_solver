-- import Cube
-- import Moves

-- -- import qualified Data.Sequence as Seq
-- import qualified Data.Set as Set

-- applyMoves :: Cube -> [(String, Cube)]
-- applyMoves cube = map (\(name, move) -> (name, move cube)) moves

-- alreadySeen :: Set.Set Cube -> Cube -> Bool
-- alreadySeen seen cube = Set.member cube seen

-- bfs :: Cube -> Set.Set Cube -> [(String, Cube)] -> [String]
-- bfs goal seen ((move, cube):qs)
--     | cube == goal = [move]
--     | otherwise = move:bfs goal newSeen newQueue
--         where
--             newMoves = filter (\(name, cube) -> not (alreadySeen seen cube)) (applyMoves cube)
--             newSeen = Set.union seen (Set.fromList (map snd newMoves))
--             newQueue = qs ++ newMoves

-- solveBfs :: Cube -> [String]
-- solveBfs cube = drop 1 $ bfs solved Set.empty [("", cube)]


--------------------------------------------------------------------------------------------------------------------------------------


-- import Cube (Cube, Face, Tile, Color, solved)
-- -- import Moves (Move)
-- import Moves (up, down, left, right, front, back, up', down', left', right', front', back')

-- import qualified Data.Sequence as Seq
-- import qualified Data.Set as Set

-- moves :: [Cube -> Cube]
-- moves = [up, down, left, right, front, back, up', down', left', right', front', back']

-- applyMoves :: Cube -> [Cube]
-- applyMoves cube = map (\move -> move cube) moves

-- alreadySeen :: Set.Set Cube -> Cube -> Bool
-- alreadySeen seen cube = Set.member cube seen

-- bfs :: Cube -> Set.Set Cube -> Seq.Seq Cube -> [Cube]
-- bfs goal seen queue
--     | q == goal = [q]
--     | otherwise = q:bfs goal newSeen newQueue
--         where
--             q = Seq.index queue 0
--             qs = Seq.drop 1 queue
--             newMoves = filter (\move -> not (alreadySeen seen move)) (applyMoves q)
--             newSeen = Set.union seen (Set.fromList newMoves)
--             newQueue = qs Seq.>< (Seq.fromList newMoves)

-- solveBfs :: Cube -> [Cube]
-- solveBfs cube = bfs solved Set.empty (Seq.singleton cube)