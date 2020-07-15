import Data.List (intersperse)     


o ss = [do k <- s
           ('|':(intersperse '|' $ map (\x -> if elem x k then 'X' else '_') [0..7]) ++ "|\n") | s <- ss]

e k w pp = filter (\p -> all (\x -> elem x p) k && all (\x -> notElem x p) w) pp

g i []
    | i >= -1 = return []
    | otherwise = []
g i (x:xs) = do p <- [0..i-x]
                w <- g (i - (p + x + 1)) xs
                return ([p..p+x-1] ++ map (+ (p + x + 1)) w)



nonogram r c = o $ find 0 (map (g 8) r) (map (g 9) c) (replicate 8 []) (replicate 8 [])
    where find _ [] cps _ _
            | any (== []) cps = []
            | otherwise = return []
          find i (rs:rps) cps cb cw
            | any (== []) cps = []
            | otherwise = do r <- rs
                             let cb' = [k' | (c, k) <- zip [0..7] cb, let k' = if elem c r then i:k else k]
                             let cw' = [w' | (c, w) <- zip [0..7] cw, let w' = if notElem c r then i:w else w]
                             s <- find (i + 1) rps (map ((uncurry . uncurry) e) (zip (zip cb' cw') cps)) cb' cw'
                             return (r:s)