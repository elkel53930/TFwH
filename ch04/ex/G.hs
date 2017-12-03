module G where

length :: [a] -> Int
length xs = loop (0,xs)
  where
    loop (n, []) = n
    loop (n, x : xs) = loop (n + 1, xs)
