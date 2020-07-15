--fib::Int->Int
--fib 0 = 0
--fib 1 = 1
--fib n = fib (n-1) + fib (n-2)

fib n = if n == 0 then 0 else if n == 1 then 1 else fib (n-1) + fib (n-2)