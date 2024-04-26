main = do
  print (f 3 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  -- O $ é uma forma de informar que a função a esquerda do dolar será executada com a parte a direita como parâmetro
  putStrLn $ show $ f 3 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ f 3 "abcdefghij"
  print $ f 6 ['a' .. 'z']
  print $ g [1, 2, 3] [4, 5, 6]
  print $ g "abc" "def"
  print $ h 3 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ h 6 "abcdefghij"
  print $ mapa (* 2) [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ mapa (^ 2) [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ filtro even [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ filtro odd [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ filtro (> 5) [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ filtro (< 5) [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ 5 `pertence` [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print $ 10 `pertence` [1, 2, 3, 4, 5, 6, 7, 8, 9]
  print $ 's' `pertence` "paralelepipedo"
  print $ 'a' `pertence` "paralelepipedo"
  print $ 5 >+>+< [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

-- Função que retorna o n-ésimo elemento de uma lista
f :: (Num a, Eq a) => a -> [b] -> b
f 0 (x : _) = x
f n (_ : xs) = f (n - 1) xs

-- Concatena duas listas
g :: [a] -> [a] -> [a]
g [] l = l
g (x : xs) l = x : (g xs l)

-- Função que retorna os n primeiros elementos de uma lista
h :: (Num a, Eq a) => a -> [b] -> [b]
h 0 _ = []
h n (x : xs) = x : h (n - 1) xs

mapa :: (a -> b) -> [a] -> [b]
mapa _ [] = []
mapa k (x : xs) = k x : mapa k xs

filtro :: (a -> Bool) -> [a] -> [a]
filtro _ [] = []
filtro t (x : xs)
  | t x = x : c
  | otherwise = c
  where
    c = filtro t xs

pertence :: (Eq a) => a -> [a] -> Bool
_ `pertence` [] = False
x `pertence` (y : ys)
  | x == y = True
  | otherwise = x `pertence` ys

(>+>+<) :: (Eq a) => a -> [a] -> Bool
_ >+>+< [] = False
x >+>+< (y : ys)
  | x == y = True
  | otherwise = x >+>+< ys