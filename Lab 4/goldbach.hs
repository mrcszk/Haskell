p :: Int -> Bool
p 1 = False
p 2 = True
p x | (length [s | s <- [2 .. x-1], x `mod` s == 0]) > 0 = False
          | otherwise = True

lp :: Int -> [Int]
lp x = [c | c <- [2..x], p c]

goldbach x = head [(a,b) | a <- pw, b <- pw, a + b == x]
    where pw = lp (x-2)