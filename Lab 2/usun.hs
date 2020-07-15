import Data.List

usun ::  Eq a => [a] -> [a]
usun = map head . group