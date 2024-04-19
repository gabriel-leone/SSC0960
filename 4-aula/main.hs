main :: IO ()
main = do
  putStrLn "Hello, World!"
  l <- getLine
  let y :: Integer
      y = read l
  let x :: Integer
      x = f 5 y
  let str = show x
  z <- g x y
  print z
  putStrLn str

f :: (Num a) => a -> a -> a
f x y = x + y

-- Aqui vou definir uma função igual f mas que é impura

g :: (Num a) => a -> a -> IO a
g x y = do
  putStrLn "Hello, World!"
  return (x + y)