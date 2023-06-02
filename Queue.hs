module Queue where


type Queue a = ([a], [a])

empty :: Queue a
empty = ([], [])

isEmpty :: Queue a -> Bool
isEmpty ([], []) = True
isEmpty _ = False

singleton :: a -> Queue a
singleton x = ([x], [])

enqueue :: a -> Queue a -> Queue a
enqueue x (xs, ys) = (xs, x:ys)

dequeue :: Queue a -> (a, Queue a)
dequeue ([], []) = error "empty queue"
dequeue ([], ys) = dequeue (reverse ys, [])
dequeue ((x:xs), ys) = (x, (xs, ys))

enqueueList :: [a] -> Queue a -> Queue a
enqueueList [] q = q
enqueueList (x:xs) q = enqueueList xs (enqueue x q)
