module LastHomework where

import Data.List
import Data.Maybe
import Data.Char
--1
which :: ([Char], [Char], [Char]) -> Char -> Int
which (x, y, z) c
    | elem c x = 1
    | elem c y = 2
    | elem c z = 3
    | otherwise = 0
--2
matches :: (Int, Int) -> (Int, Int) -> Bool
matches (x, y) (a, b) = elem x [a, b] || elem y [a, b]
--3
toUpperCase :: String -> String
toUpperCase [] = []
toUpperCase s = (toUpper $ head s) : tail s
--4
swap :: Maybe a -> b -> Maybe b
swap (Just _) x = Just x
swap Nothing _ = Nothing
--5
numeric :: String -> Int
numeric = sum . map rwx
    where
        rwx :: Char -> Int
        rwx 'r' = 4
        rwx 'w' = 2
        rwx 'x' = 1
--6
pythagoreans :: [(Int, Int, Int)]
pythagoreans = [(a, b, c) | a <- [1..100], b <- [a..100], c <- [b..100], a^2 + b^2 == c^2]
--7
hasLongWord :: Int -> String -> Bool
hasLongWord n s
    | notElem ' ' s = length s >= n
    | otherwise = (length $ takeWhile (/= ' ') s) >= n || hasLongWord n (dropWhile (== ' ') $ dropWhile (/= ' ') s)
--a megadott tesztesetekben lehetne tail is de ez kiakadna tobb space eseteben ^^^
--8
align :: Int -> String -> String
align n s = replicate (n - length s) ' ' ++ s
--9
modify :: (a -> Maybe a) -> [a] -> [a]
modify _ [] = []
modify f (x:xs)
    | isNothing $ f x = xs
    | otherwise = ((fromJust $ f x):xs)
--10
isLonger :: [a] -> Int -> Bool
isLonger [] _ = False
isLonger _ 0 = True
isLonger (x:xs) n = isLonger xs $ n - 1
--11
removeAccents :: String -> String
removeAccents [] = []
removeAccents (x:xs)
    | x == 'á' = 'a' : removeAccents xs
    | x == 'é' = 'e' : removeAccents xs
    | x == 'í' = 'i' : removeAccents xs
    | elem x "óöő" = 'o' : removeAccents xs
    | elem x "úüű" = 'u' : removeAccents xs
    | otherwise = x : removeAccents xs
--12
strip :: String -> String
strip = reverse . dropWhile (== '_') . reverse . dropWhile (== '_')
--13
data RPS = Rock | Paper | Scissors
    deriving (Show, Eq)

beats :: RPS -> RPS
beats Rock = Scissors
beats Paper = Rock
beats Scissors = Paper
--14
firstBeats :: [RPS] -> [RPS] -> Int
firstBeats [] _ = 0
firstBeats _ [] = 0
firstBeats (x:xs) (y:ys)
    | beats x == y = 1 + firstBeats xs ys
    | otherwise = firstBeats xs ys
--15
data Temperature = Daytime Int | Night Int
    deriving (Show, Eq)

isDaytime :: Temperature -> Bool
isDaytime (Daytime _) = True
isDaytime (Night _) = False
--16
extremes :: [Temperature] -> (Int, Int)
extremes l = (dayMax, nightMin)
    where
        fromTemp :: Temperature -> Int
        fromTemp (Daytime x) = x
        fromTemp (Night x) = x

        dayMax = maximum $ map fromTemp $ filter isDaytime l

        nightMin = minimum $ map fromTemp $ filter (not . isDaytime) l