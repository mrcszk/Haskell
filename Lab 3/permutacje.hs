import System.Random

permutacje x = 
    if length x < 2 
        then return x
    else do
        y <- randomRIO (0, length(x)-1)
        p <- permutacje (take y x ++ drop (y+1) x)
        return (x!!y : p)