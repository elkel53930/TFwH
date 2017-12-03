module L where

import K

{-
  crosss (f, g) . cross (h, k) = cross (f . h, g . k)
  {- crossの定義の展開 -}
  cross (f, g) . fork (h . fst, k . snd)
  {- 1 -}
  fork (f . (h . fst), g . (k . snd))
  {- .の結合法則 -}
  fork ((f . h) . fst, (g . k) . snd)
  {- crossの定義 -}
  cross (f . h, g . k)
-}

class Bifunctor p where
  bimap :: (a -> b) -> (c -> d) -> p a c -> p b d

instance Bifunctor (,) where
  bimap = curry cross
{- cross = uncurry bimap -}

instance Bifunctor Either where
  bimap f g = either (Left . f) (Right . g)
