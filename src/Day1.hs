module Day1 where

import Data.Maybe

findMatchingPair :: Int -> [Int] -> Maybe (Int, Int)
findMatchingPair total (head:tail) = if (total - head) `elem` tail then Just (head, (total - head)) else findMatchingPair total tail
findMatchingPair _ [] = Nothing

f :: [Int] -> Maybe (Int, Int, Int)
f [] = Nothing
f (head:tail) = case findMatchingPair (2020 - head) tail of
  Nothing -> f tail
  Just (first, second) -> Just (first, second, head)

part1 :: [Int] -> Int
part1 ints = do
  let (first, second) = Data.Maybe.fromJust (findMatchingPair 2020 ints)
  first * second

part2 :: [Int] -> Int
part2 ints = do
  let (first, second, third) = Data.Maybe.fromJust (f ints)
  first * second * third

main :: [String] -> IO ()
main input = do
  let ints = map (read :: String -> Int) input
  print (part1 ints)
  print (part2 ints)
