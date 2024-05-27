import Data.List (intercalate)

type Frame = [Int]

main :: IO ()
main = do
  rolls <- fmap (map read . words) getLine
  let (frames, totalScore) = computeBowlingScore rolls
  putStrLn $ displayFrames frames totalScore

computeBowlingScore :: [Int] -> ([Frame], Int)
computeBowlingScore rolls = calculateFrames rolls 0 [] 0
  where
    calculateFrames :: [Int] -> Int -> [Frame] -> Int -> ([Frame], Int)
    calculateFrames rolls rollIndex frames totalScore
      | length frames == 10 = (finalizeFrame frames rolls rollIndex, totalScore)
      | isStrike rolls rollIndex = handleStrike rolls rollIndex frames totalScore
      | isSpare rolls rollIndex = handleSpare rolls rollIndex frames totalScore
      | otherwise = handleOpenFrame rolls rollIndex frames totalScore

    isStrike :: [Int] -> Int -> Bool
    isStrike rolls rollIndex = rolls !! rollIndex == 10

    isSpare :: [Int] -> Int -> Bool
    isSpare rolls rollIndex = rolls !! rollIndex + rolls !! (rollIndex + 1) == 10

    handleStrike :: [Int] -> Int -> [Frame] -> Int -> ([Frame], Int)
    handleStrike rolls rollIndex frames totalScore =
      let score = 10 + strikeBonus rolls rollIndex
          newFrame = [10, 0] -- Representa X _
       in calculateFrames rolls (rollIndex + 1) (frames ++ [newFrame]) (totalScore + score)

    strikeBonus :: [Int] -> Int -> Int
    strikeBonus rolls rollIndex = rolls !! (rollIndex + 1) + rolls !! (rollIndex + 2)

    handleSpare :: [Int] -> Int -> [Frame] -> Int -> ([Frame], Int)
    handleSpare rolls rollIndex frames totalScore =
      let score = 10 + spareBonus rolls rollIndex
          newFrame = [rolls !! rollIndex, 10 - rolls !! rollIndex] -- Representa spare
       in calculateFrames rolls (rollIndex + 2) (frames ++ [newFrame]) (totalScore + score)

    spareBonus :: [Int] -> Int -> Int
    spareBonus rolls rollIndex = rolls !! (rollIndex + 2)

    handleOpenFrame :: [Int] -> Int -> [Frame] -> Int -> ([Frame], Int)
    handleOpenFrame rolls rollIndex frames totalScore =
      let score = rolls !! rollIndex + rolls !! (rollIndex + 1)
          newFrame = [rolls !! rollIndex, rolls !! (rollIndex + 1)]
       in calculateFrames rolls (rollIndex + 2) (frames ++ [newFrame]) (totalScore + score)

    finalizeFrame :: [Frame] -> [Int] -> Int -> [Frame]
    finalizeFrame frames rolls rollIndex =
      if isSpecialLastFrame then init frames ++ [completeFinalFrame] else frames
      where
        lastFrame = last frames
        isSpecialLastFrame = (head lastFrame == 10) || (sum lastFrame == 10)
        extraRolls = drop rollIndex rolls
        completeFinalFrame
          | head lastFrame == 10 = 10 : take 2 extraRolls
          | sum lastFrame == 10 = lastFrame ++ take 1 extraRolls
          | otherwise = lastFrame

displayFrames :: [Frame] -> Int -> String
displayFrames frames totalScore = intercalate " | " (map showFrame (init frames) ++ [showFinalFrame (last frames)]) ++ " | " ++ show totalScore
  where
    showFrame :: Frame -> String
    showFrame [10, 0] = "X _"
    showFrame [a, b]
      | a + b == 10 = show a ++ " /"
      | otherwise = show a ++ " " ++ show b
    showFrame [10, 0, c, d] = "X _ " ++ show c ++ " " ++ show d
    showFrame [a, b, c] = show a ++ " / " ++ show c
    showFrame _ = error "Invalid frame"

    showFinalFrame :: Frame -> String
    showFinalFrame [10, 10, 10] = "X X X"
    showFinalFrame [10, a, b]
      | a + b == 10 = "X " ++ show a ++ " /"
      | otherwise = "X " ++ show a ++ " " ++ show b
    showFinalFrame [10, 10] = "X X"
    showFinalFrame [a, b, 10] = show a ++ " / X"
    showFinalFrame frame = showFrame frame
