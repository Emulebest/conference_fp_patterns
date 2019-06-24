module Monad where

-- Recap
-- fmap :: (Functor f) => (a -> b) -> f a -> f b
-- (<*>) :: (Applicative f) => f (a -> b) -> f a -> f b
-- ghci> (*) <$> Just 2 <*> Just 8
-- Just 16
-- ghci> (++) <$> Just "klingon" <*> Nothing
-- Nothing
-- ghci> (-) <$> [3,4] <*> [1,2,3]
-- [2,1,0,3,2,1]


-- Now Monads!
--(>>=) :: (Monad m) => m a -> (a -> m b) -> m b

-- Ok, right, we need a function that does have signature (a -> m b)
-- ghci> (\x -> Just (x+1)) 1
-- Just 2
-- ghci> (\x -> Just (x+1)) 100
-- Just 101


-- (a -> Maybe b) looks like (\x -> Just (x+1))
applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f  = Nothing
applyMaybe (Just x) f = f x

-- ghci> Just 3 `applyMaybe` \x -> Just (x+1)
-- Just 4
-- ghci> Just "smile" `applyMaybe` \x -> Just (x ++ " :)")
-- Just "smile :)"
-- ghci> Nothing `applyMaybe` \x -> Just (x+1)
-- Nothing
-- ghci> Nothing `applyMaybe` \x -> Just (x ++ " :)")
-- Nothing


-- The monad class
class Monad m where
    return :: a -> m a

    (>>=) :: m a -> (a -> m b) -> m b

    (>>) :: m a -> m b -> m b
    x >> y = x >>= \_ -> y

    fail :: String -> m a
    fail msg = error msg

-- ghci> return "WHAT" :: Maybe String
-- Just "WHAT"
-- ghci> Just 9 >>= \x -> return (x*10)
-- Just 90
-- ghci> Nothing >>= \x -> return (x*10)
-- Nothing

-- Callback-hell. Haskell style!
foo :: Maybe String
foo = Just 3   >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))

-- Here comes the do notation
foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)

-- ghci> Just 9 >>= (\x -> Just (x > 8))
-- Just True
marySue :: Maybe Bool
marySue = do
    x <- Just 9
    Just (x > 8)

-- Pattern matching works here too
justH :: Maybe Char
justH = do
    (x:xs) <- Just "hello"
    return x