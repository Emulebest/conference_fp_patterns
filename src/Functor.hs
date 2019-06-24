module Functor where

class Functor f where
    fmap :: (a -> b) -> f a -> f b


instance Functor.Functor [] where
    fmap = map


-- map :: (a -> b) -> [a] -> [b]
-- ghci> fmap (*2) [1..3]
-- [2,4,6]
-- ghci> map (*2) [1..3]
-- [2,4,6]

data Maybe a = Nothing | Just a

--instance Functor Maybe where
--    fmap f (Just x) = Just (f x)
--    fmap f Nothing = Nothing

-- ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")
-- Just "Something serious. HEY GUYS IM INSIDE THE JUST"
-- ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing
-- Nothing
-- ghci> fmap (*2) (Just 200)
-- Just 400
-- ghci> fmap (*2) Nothing
-- Nothing

-- fmap has an infix analog `<$>`
-- ghci> (++ " HEY GUYS IM INSIDE THE JUST") <$> (Just "Something serious.")
-- Just "Something serious. HEY GUYS IM INSIDE THE JUST"

-- There is a problem though
-- What if the function take more than 1 argument?
twoParamsSum :: Int -> Int -> Int
twoParamsSum x y = x + y

-- What to do?
invokeSum :: Prelude.Maybe Int
invokeSum = twoParamsSum <$> (Prelude.Just 3)