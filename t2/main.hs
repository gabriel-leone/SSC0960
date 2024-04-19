-- Função para verificar se um número é primo
isPrime :: Int -> Bool
isPrime n
    | n <= 1 = False
    | otherwise = null [x | x <- [2..floor(sqrt(fromIntegral n))], n `mod` x == 0]

-- Função para encontrar o próximo número primo após um dado número
nextPrime :: Int -> Int
nextPrime n
    | isPrime n = n
    | otherwise = nextPrime (n + 1)

-- Função para calcular o comprimento do maior intervalo entre dois números primos consecutivos
maiorIntervaloPrimos :: Int -> Int -> Int
maiorIntervaloPrimos x y = go (nextPrime x) (nextPrime (x + 1)) 0
    where
        go a b maxLength
            | b > y = maxLength
            | otherwise = if isPrime b
                          then go b (nextPrime (b + 1)) (max maxLength (b - a))
                          else go a (b + 1) maxLength

-- Função principal para ler os inteiros x e y, chamar a função e imprimir o resultado
main :: IO ()
main = do
    x <- readLn
    y <- readLn
    let resultado = maiorIntervaloPrimos x y
    print resultado
