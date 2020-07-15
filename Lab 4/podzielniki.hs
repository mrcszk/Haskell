podzielniki x = podzielnik x 2
  where
    podzielnik x dz
      | x < dz*dz = [x]
      | x `mod` dz == 0 = dz : podzielnik (x `div` dz) dz 
      | otherwise = podzielnik x (dz + 1) 