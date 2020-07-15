import Data.List
import Control.Arrow

koduj_rle :: Eq a => [a] -> [(Int, a)]
koduj_rle x =  map (length &&& head) . group $x