odwroc :: [a] -> [a]
odwroc [] = []
odwroc (h:t) = odwroc t ++ [h]