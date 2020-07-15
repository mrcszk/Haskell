odwroc :: [a] -> [a]
odwroc [] = []
odwroc (h:t) = odwroc t ++ [h]

czyPalindrom :: (Eq a) => [a] -> Bool
czyPalindrom x = x == odwroc x