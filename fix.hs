module Fix where

fix :: (a -> a) -> a
fix f = f (fix f)
