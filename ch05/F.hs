import Prelude hiding (Word, takeWhile, dropWhile, span , words, break)
import Data.Char (isSpace)

takeWhile :: (a->Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs)
  | p x        = x : takeWhile p xs
  | otherwise  = []

dropWhile :: (a->Bool) -> [a] -> [a]
dropWhile _ [] = []
dropWhile p (x:xs)
  | p x        = dropWhile p xs
  | otherwise  = x:xs

whilteSpace :: Char -> Bool
whilteSpace = isSpace

span :: (a->Bool) -> [a] -> ([a],[a])
span p xs = (takeWhile p xs, dropWhile p xs)

type Word = String

words :: String -> [Word]
words xs = case span (not . whilteSpace) xs of
  ([],[]) -> []
  ([], _:zs) -> words zs
  (ys,[])    -> [ys]
  (ys, _:zs) -> ys : words zs
