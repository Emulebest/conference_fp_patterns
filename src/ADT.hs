module ADT where

-- Typescript Enum
-- enum Day {
--  Monday,
--  Tuesday,
--  Wednesday,
--  Thursday,
--  Friday,
--  Saturday,
--  Sunday
-- }

-- Same Haskell
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

data Bool = False | True

-- data Int = -2147483648 | -2147483647 | ... | -1 | 0 | 1 | 2 | ... | 2147483647

data Shape = Circle Float Float Float | Rectangle Float Float Float Float

-- ghci> :t Circle
-- Circle :: Float -> Float -> Float -> Shape
-- ghci> :t Rectangle
-- Rectangle :: Float -> Float -> Float -> Float -> Shape

-- Pattern matching?
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- Types with parameters
data Maybe a = Nothing | Just a
-- ghci> Just "Haha"
-- Just "Haha"
-- ghci> Just 84
-- Just 84
-- ghci> :t Just "Haha"
-- Just "Haha" :: Maybe [Char]
-- ghci> :t Just 84
-- Just 84 :: (Num t) => Maybe t
-- ghci> :t Nothing
-- Nothing :: Maybe a
-- ghci> Just 10 :: Maybe Double
-- Just 10.0

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)
-- ghci> Vector 3 5 8 `vplus` Vector 9 2 8
-- Vector 12 7 16