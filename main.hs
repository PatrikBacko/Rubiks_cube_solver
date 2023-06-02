import System.CPUTime
import Bfs
import Cube
import Moves


main :: IO ()
main = do
    start <- getCPUTime
    let result = solveBfs (up (right (left (front (back solved)))))
    end <- getCPUTime
    let diff = fromIntegral (end - start) / (10^12)
    putStrLn $ "Result: " ++ show result
    putStrLn $ "Time: " ++ show diff ++ " seconds"