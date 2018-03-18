import Prelude hiding (minimum)

minimum :: (Ord a) => [a] -> a
minimum = foldr1 min
--minimum = foldr1 (\x y -> if x < y then x else y)
