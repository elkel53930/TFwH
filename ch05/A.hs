import Data.List

type Matrix a = [[a]]

incMatrix :: Matrix Integer -> Matrix Integer
incMatrix = map (map (+1))

sumMatrix :: Matrix Integer -> Integer
sumMatrix = sum . concat

addMatrix :: Matrix Integer -> Matrix Integer -> Matrix Integer
addMatrix = zipWith (zipWith (+))

cols :: Matrix a -> Matrix a
cols [xs] = [[x] | x <- xs]
cols (xs : xss) = zipWith (:) xs (cols xss)

scalarMult :: (Num a) => [a] -> [a] -> a
scalarMult xs ys = sum (zipWith (*) xs ys)

prodMatrix :: Matrix Integer -> Matrix Integer -> Matrix Integer
prodMatrix xs ys =
  [map (scalarMult row) mbt | row <- xs]
  where mbt = transpose ys
