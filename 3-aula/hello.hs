f1 x y z = x + y + z

f1 :: (Num a) => a -> a -> a -> a

f2 x y = if x == y then x + 1 else x + y

f2 :: (Eq a, Num a) => a -> a -> a

main = do
  x <- readLn
  y <- readLn
  print (f1 x y 3)
  print (f2 x y)
