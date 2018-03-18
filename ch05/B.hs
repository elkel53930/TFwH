type Matrix a = [[a]]

{-
[[],[]] は2行,0列
[]は0行,n列
-}

-- hlintにfoldrしろって言われる
transpose :: [[a]] -> [[a]]
transpose [] = repeat []
-- transpose [xs] = [[x] | x<-xs]
transpose (xs:xss) = zipWith (:) xs ( transpose xss )

transposeC :: [[a]] -> [[a]]
transposeC xss
 | any null xss = []
 | otherwise    = map head xss : transposeC (map tail xss)
