-- module Queue where

-- import Cube

-- data State = State Cube State String | Nill
-- data Queue = Queue Head Tail deriving (Show)
-- data Node = Node State Next Prev | Empty deriving (Show)

-- type Head = Node
-- type Tail = Node
-- type Next = Node
-- type Prev = Node


-- empty :: Queue
-- empty = Queue (Node Nill Empty Empty) (Node Nill Empty Empty)

-- -- singleton :: State -> Queue
-- -- singleton State = Queue (Node undefined Nill Nill) (Node undefined Nill Nill)

-- insert :: State -> Queue -> Queue
-- insert state (Queue head tail) = Queue head (Node state tail Empty)