import Data.List

lsortuj :: [[a]] -> [[a]]
lsortuj = sortBy (\x y -> compare (length x) (length y))