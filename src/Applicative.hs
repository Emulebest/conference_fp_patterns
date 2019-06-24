module Applicative where


-- And we are back
twoParamsSum :: Int -> Int -> Int
twoParamsSum x y = x + y

-- What to do?
--invokeSum :: Prelude.Maybe Int
--invokeSum = twoParamsSum <$> (Prelude.Just 3)

-- What do we actually get from invokeSum?
invokeSum :: Prelude.Maybe (Int -> Int)
invokeSum = twoParamsSum <$> (Prelude.Just 3)
-- This worked somehow

-- There needs to be a solution
class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

instance Applicative Maybe where
    pure = Just
    Nothing <*> _ = Nothing
    (Just f) <*> something = fmap f something

-- ghci> Just (+3) <*> Just 9
-- Just 12
-- ghci> pure (+3) <*> Just 10
-- Just 13
-- ghci> pure (+3) <*> Just 9
-- Just 12
-- ghci> Just (++"hahah") <*> Nothing
-- Nothing
-- ghci> Nothing <*> Just "woot"
-- Nothing

-- Let's try our own!
sumInvoked :: Maybe Int
sumInvoked = twoParamsSum <$> Just 3 <*> Just 7
