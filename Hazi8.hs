module Hazi8 where

type Spell magic = (magic -> (Bool, magic))
type Stabilizer magic = (magic -> magic)
type Crate item = [[item]]
type Checker item = (item -> Bool)
type Amount = Int
type Cool = (Amount -> Bool)
--1
prepare :: [Spell container] -> container -> container
prepare [] x = x
prepare (f:fs) x
    | fst $ f x = prepare fs $ snd $ f x
    | otherwise = prepare fs x
--2
stabilize :: Eq magic => Stabilizer magic -> magic -> magic
stabilize f x
    | x == f x = x
    | otherwise = stabilize f $ f x
--3
brew :: (Integral item, Num ultimatrum) => Checker ultimatrum -> Stabilizer ultimatrum -> Crate item -> ultimatrum
brew f g = go 0
    where
        go acc [] = acc
        go acc l
            | f n = go n $ tail l
            | otherwise = go (g acc) l
            where
                n = acc + fromIntegral (sum $ head l)
--4
cooldown :: Eq magic => [magic] -> Cool -> [magic]
cooldown xs f = concatMap remDup $ group xs --gondolom meg lehet oldani 2 fuggvennyel
    where
        remDup :: [magic] -> [magic]
        remDup ys
            | f $ length ys = [head ys]
            | otherwise = ys
        group :: Eq magic => [magic] -> [[magic]]
        group [] = []
        group (z:zs) = (z : takeWhile (== z) zs) : group (dropWhile (== z) zs)