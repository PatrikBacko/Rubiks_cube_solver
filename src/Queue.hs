module Queue where

-- Queue: a queue data structure, uses two lists to implement a queue
type Queue a = ([a], [a])

-- empty: create an empty queue
empty :: Queue a
empty = ([], [])

-- isEmpty: check if a queue is empty
isEmpty :: Queue a -> Bool
isEmpty ([], []) = True
isEmpty _ = False

-- singleton: create a queue with one element
singleton :: a -> Queue a
singleton x = ([x], [])

-- enqueue: add an element to the queue
enqueue :: a -> Queue a -> Queue a
enqueue x (xs, ys) = (xs, x:ys)

-- dequeue: remove an element from the queue and return the element and the new queue
dequeue :: Queue a -> (a, Queue a)
dequeue ([], []) = error "empty queue"
dequeue ([], ys) = dequeue (reverse ys, [])
dequeue ((x:xs), ys) = (x, (xs, ys))

-- enqueueList: add a list of elements to the queue
enqueueList :: [a] -> Queue a -> Queue a
enqueueList [] q = q
enqueueList (x:xs) q = enqueueList xs (enqueue x q)
