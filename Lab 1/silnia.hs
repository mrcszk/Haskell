-- silnia n = if n == 0 then 1 else n * silnia (n-1)

silnia 0 = 1
silnia n = n * silnia (n-1)