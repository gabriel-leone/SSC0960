segmentoCrescente :: [Int] -> Int
segmentoCrescente [] = 0
segmentoCrescente xs = segmentoCrescenteAux 1 (head xs) xs

segmentoCrescenteAux :: Int -> Int -> [Int] -> Int
segmentoCrescenteAux _ _ [] = 0
segmentoCrescenteAux len _ [x] = len
segmentoCrescenteAux len prev (x : y : xs)
  | y > x = segmentoCrescenteAux (len + 1) y (y : xs)
  | otherwise = max len (segmentoCrescenteAux 1 y (y : xs))

main :: IO ()
main = do
  entrada <- getLine
  let lista = map (read :: String -> Int) $ words entrada
  print $ segmentoCrescente lista