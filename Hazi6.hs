module Hazi6 where

type Air = Int
type Fire = Integer
type Shadow = Float
type Haskell = Double
type Open = String
type Key a b = [[(a,[b])]]
type Type = String
type Power = Integer
type Missile = (Type, Power)
--1
mind_vision :: Ord magic => [magic] -> Bool
mind_vision [] = True
mind_vision [_] = True
mind_vision (x0:x1:xs) = x0 <= x1 && mind_vision (x1:xs)
--2
lock :: Key a b -> Open
lock [(x,xs):[y,ys]]            = "First"
lock ([_]:[(x,[xs])]:[y,ys]:[]) = "Second"
lock ([(x,y:_:[])]:[])          = "Third"

magic_key_1 = [[(0,[0]),(0,[0]),(0,[0])]]
magic_key_2 = [[(0,[0])],[(0,[0])],[(0,[0]),(0,[0])]]
magic_key_3 = [[(0,[0,1])]]
--3
mage_armor :: [Missile] -> Type -> Power
mage_armor xs a = sum [x1 | (x0,x1) <- xs, x0 /= a]
--4
backfire :: [Missile] -> [Missile]
backfire [] = []
backfire ((x0,x1):xs)
    | x1 < 50 = backfire $ back_backfire_fire (x0,x1) xs
    | otherwise = (x0,x1) : backfire xs
    where
        back_backfire_fire :: Missile -> [Missile] -> [Missile]
        back_backfire_fire _ [] = []
        back_backfire_fire (x0,x1) ((y0,y1):ys)
            | x0 == y0 = (y0,y1 - x1) : back_backfire_fire (x0,x1) ys
            | otherwise = (y0,y1) : back_backfire_fire (x0,x1) ys