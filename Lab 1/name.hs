main::IO()
main = do
    putStrLn ("Czesc jak masz na imie?")
    name <- getLine
    putStrLn ("Czesc " ++ name)