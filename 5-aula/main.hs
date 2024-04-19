import Data.Binary.Get (label)

main :: IO ()
main = do
  -- l <- getLine
  -- let x :: Integer
  --     x = read l
  -- let s = sinal x
  -- let str = show s
  -- putStrLn "O sinal é:"
  -- putStrLn str
  -- l <- getLine
  -- let t :: Integer
  --     t = read l
  -- let s = tempo t
  -- putStrLn "A temperatura é:"
  -- putStrLn s
  -- l <- getLine
  -- let p :: Float
  --     p = read l
  -- l <- getLine
  -- let a :: Float
  --     a = read l
  -- let s = imc p a
  -- putStrLn "O IMC é:"
  -- putStrLn s
  -- l <- getLine
  -- let a :: Float
  --     a = read l
  -- l <- getLine
  -- let b :: Float
  --     b = read l
  -- l <- getLine
  -- let c :: Float
  --     c = read l
  -- let s = bhaskara a b c
  -- putStrLn "As raízes são:"
  -- print s
  -- l <- getLine
  -- let n :: Integer
  --     n = read l
  -- let s = fat3 n
  -- putStrLn "O fatorial é:"
  -- print s
  -- a variável "arr" será uma lista de inteiros
  -- let arr = [1, 2, 3, 4, 5]
  -- a variável "s" será a soma dos elementos da lista "arr"
  -- let s = somapares arr
  -- imprime a soma
  -- print s
  -- a variável arr1 é um array de inteiros desordenado
  let arr1 = [5, 2, 8, 1, 3, 7, 9, 4, 6]
  -- a variável arr2 é um array de inteiros desordenado
  let arr2 = [4, 3, 2, 1, 0]
  -- imprime o array ordenado
  let s = merge arr1 arr2
  print s

-- sinal :: Integer -> Integer
-- sinal x = if x > 0 then 1 else if x == 0 then 0 else -1

sinal :: Integer -> Integer
sinal x
  | x > 0 = 1
  | x == 0 = 0
  | otherwise = -1

tempo :: Integer -> String
tempo x
  | x < 0 = "Congelante"
  | x < 15 = "Frio"
  | x < 25 = "Ideal"
  | x < 35 = "Quente"
  | x < 45 = "Muito Quente"
  | otherwise = "Vulcânico"

imc :: Float -> Float -> String
imc peso altura
  | imc < 18.5 = "Abaixo do peso"
  | imc < 25 = "Peso normal"
  | imc < 30 = "Sobrepeso"
  | imc < 35 = "Obesidade Grau 1"
  | imc < 40 = "Obesidade Grau 2"
  | otherwise = "Obesidade Grau 3"
  where
    imc = peso / (altura ^ 2)

bhaskara :: Float -> Float -> Float -> [Float]
bhaskara a b c
  | delta < 0 = error "Nao ha raizes reais"
  | delta == 0 = [(-b) / (2 * a)]
  | otherwise = [(-b + sqrt delta) / (2 * a), (-b - sqrt delta) / (2 * a)]
  where
    delta = b ^ 2 - 4 * a * c

fat1 :: Integer -> Integer
fat1 n = if n == 0 then 1 else n * fat1 (n - 1)

fat2 :: Integer -> Integer
fat2 n
  | n == 0 = 1
  | otherwise = n * fat2 (n - 1)

fat3 :: Integer -> Integer
fat3 0 = 1
fat3 n = n * fat3 (n - 1)

vazia :: [a] -> Integer
vazia [] = 0
vazia _ = 1

soma :: [Integer] -> Integer
soma [] = 0
soma (cabeca : cauda) = cabeca + soma cauda

somapares :: [Integer] -> [Integer]
somapares [] = []
somapares [x] = [x]
somapares (x : y : zs) = (x + y) : somapares zs

divide :: [Integer] -> [[Integer]]
divide [] = [[], []]
divide [x] = [[x], []]
divide (x : y : zs) = [x : t1, y : t2]
  where
    [t1, t2] = divide zs

merge :: [Integer] -> [Integer] -> [Integer]
merge [] l = l
merge l [] = l
merge (x : xs) (y : ys)
  | x < y = x : merge xs (y : ys)
  | otherwise = y : merge (x : xs) ys