module H where

take :: Int -> [a] -> [a]
take 0 _ = []
take n (x:xs) = x : H.take (n - 1) xs

take' :: Int -> [a] -> [a]
take' n xxs
  | n <= 0    = []
  | otherwise = case xxs of
    x : xs -> x : take' (n - 1) xs
    []     -> []

drop :: Int -> [a] -> [a]
drop 0 xs = xs
drop n (_:xs) = H.drop (n - 1) xs

drop' :: Int -> [a] -> [a]
drop' n xxs
  | n <= 0    = xxs
  | otherwise = case xxs of
    _ : xs -> drop' (n - 1) xs
    []     -> []

splitAt :: Int -> [a] -> ([a],[a])
splitAt n xxs
  | n <= 0    = ([], xxs)
  | otherwise = case xxs of
    x : xs -> (x : hd, tl) where (hd,tl) = H.splitAt (n-1) xs
    []     -> ([],[])

para :: (a -> ([a],b) -> b) -> b -> [a] -> b
para f e [] = e
para f e (x:xs) = f x (xs, para f e xs)
