import Data.List (delete)
 
start :: [(Int,Int)] -> ([(Int,Int)],[(Int,Int)])
start p = (p,[])
 
konc :: ([(Int,Int)],[(Int,Int)]) -> Bool
konc (aa,_) = null aa 
 
nast :: ([(Int,Int)],[(Int,Int)]) -> [([(Int,Int)],[(Int,Int)])]
nast (aa,[]) =
  [(delete a aa, [a]) | a <- aa]
nast (aa,n@((x,y):qs)) =
  [(delete (u,v) aa,(u,v):n) | (u,v) <- aa, u /= v, v == x] ++
  [(delete (u,v) aa,(v,u):n) | (u,v) <- aa, u /= v, u == x] ++
  [(delete (u,v) aa,(u,v):n) | (u,v) <- aa, u == v, u == x] 
 
rozw :: [(Int,Int)] -> [([(Int,Int)],[(Int,Int)])]
rozw p = szukaj [(start p)]
  where
    szukaj []        = []
    szukaj (e:es)  
      | konc e = e : szukaj es
      | otherwise = szukaj (nast e ++ es)
 
domino :: [(Int,Int)] -> [[(Int,Int)]]
domino d = map snd (rozw d)