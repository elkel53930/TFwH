module K where

fork :: (a -> b, a -> c) -> a -> (b, c)
fork (f, g) x = (f x, g x)

unzip :: [(a, b)] -> ([a], [b])
unzip = K.fork (map fst, map snd)

cross :: (a -> c, b -> d) -> (a, b) -> (c, d)
cross (f,g) = fork (f . fst, g . snd)

{-
  1  corss (f, g) . fork (h, k) = fork (f . h, g . k)
  2  fork (f, g) . h            = fork (f . h, g . h)
  3  fst . cross (f, g)         = f . fst
  4  snd . cross (f, g)         = g . snd
-}

{-
  corss (map f, map g) . unzip
  {- unzipの展開 -}
  corss (map f, map g) . fork (map fst, map snd)
  {- 1 -}
  fork (map f . map fst, map g . map snd)
  {- mapのFunctor則 -}
  fork (map (f . fst), map (g . snd))
  {- 3と4 -}
  fork (map (fst . cross (f, g)), map (snd . cross (f, g)))
  {- mapのFunctor則 -}
  fork (map fst . map (cross (f, g)), map snd . map (cross (f, g)))
  {- 2 -}
  fork (map fst, map snd) . map (corss (f, g))
  {- unzip -}
  unzip . map (cross (f, g))
-}
