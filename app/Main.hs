module Main where

justInteger :: Int
justInteger = 10

justString :: String
justString = "Hello world"

singleParamFunction :: Int -> Int
singleParamFunction x = x + 10

multipleParams :: String -> String -> String
multipleParams str1 str2 = str1 ++ str2

generics :: (Fractional a) => a
generics = 10
--generics = 15.2

myLambda :: (Int -> Int)
myLambda = \x -> x + 10

main :: IO ()
main = print "Hello world"
