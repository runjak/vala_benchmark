{-# LANGUAGE BangPatterns #-}
module Main where

import qualified System.Random.Mersenne as Random

testSize :: Double
testSize = 1000000

inCircle :: Double -> Double -> Bool
inCircle x y = sqrt (x*x + y*y) <= 1

simpleCarlo :: [Double] -> Double
simpleCarlo rs =
  let !ins = go testSize rs 0
      !outs = testSize - ins
  in ins / outs
  where
    go :: Double -> [Double] -> Double -> Double
    go !steps !(x:y:xs) !count
      | steps <= 0 = count
      | inCircle x y = go (steps - 1) xs (count + 1)
      | otherwise = go (steps - 1) xs count
    go _ _ !count = count

main :: IO ()
main = do
  rs <- Random.randoms =<< Random.getStdGen
  print $ simpleCarlo rs
