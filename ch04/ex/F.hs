module F where

import Data.List

data List a = Nil | Snoc (List a) a
  deriving Show

head :: List a -> a
head Nil = undefined
head (Snoc Nil x) = x
head (Snoc list x) = F.head list

last :: List a -> a
last Nil = undefined
last (Snoc _ x) = x

-- 逆になっちゃう
toList :: [a] -> List a
toList [] = Nil
toList (x:xs) = Snoc (toList xs) x

toListF :: [a] -> List a
toListF = foldl Snoc Nil

-- 逆になっちゃう
fromList :: List a -> [a]
fromList Nil = []
fromList (Snoc list a) = a : fromList list

fromListF :: List a -> [a]
fromListF = reverse . unfoldr destruct
  where
    destruct (Snoc xs x) = Just (x,xs)
    destruct Nil         = Nothing

fromList' :: List a -> [a]
fromList' = rec' []
  where
    rec' a Nil = a
    rec' a (Snoc xs x) = rec' (x : a) xs
