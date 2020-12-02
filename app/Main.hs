module Main where


import qualified Day1



main :: IO ()
main = do
  contents <- readFile "./inputs/Day1.txt"
  Day1.main (lines contents)
