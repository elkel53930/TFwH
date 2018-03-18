import Data.List hiding (nub)

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) = x : nub (filter (/=x) xs)

nubO :: Ord a => [a] -> [a]
nubO = map head . group . sort

-- 以下は、TFwHに書かれている答えバージョン
nubOA :: Ord a => [a] -> [a]
nubOA = remdups . sort

remdups [] = []
remdups (x:xs) = x : remdups (dropWhile (==x) xs)
