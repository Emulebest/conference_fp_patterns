module Curry where

-- Haskell
sampleMap :: [Int]
sampleMap = map (\x -> 2 * x) [1, 2, 3, 4, 5] -- => [2, 4, 6, 8, 10]

samplePlus :: Int -> (Int -> Int)
samplePlus n = (\m -> n + m)
            -- > g = samplePlus 10
            -- > g 8 -- would return 18
            -- > g 4 -- would return 14

-- Javascript
-- function add (a) {
--   return function (b) {
--     return a + b;
--   }
-- }
--
-- add(3)(4)

curry :: (a -> b -> c) -> a -> (b -> c)
curry f n = \m -> f n m

-- g = curry (+) 5
-- > g 10 -- returns 15
--
-- h = curry (*) 5
-- > g 10 -- returns 50

curriedSum :: (Num a) => a -> a -> a
curriedSum x y = x + y

