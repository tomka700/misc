module L where
--1
points :: Integral a => [(String, a, a)] -> [(String, a)] 
points = (\a -> filter (\x -> snd x > 0) (map (\(x, y, z) -> (x, 100 - z - div y 2)) (filter (\(x, y, z) -> z /= 100) a)))
--2
type Apple = (Bool, Int)
type Tree = [Apple]
type Garden = [Tree]

ryuksApples :: Garden -> Int
ryuksApples = (\x -> sum $ map (\y -> length $ filter (\z -> fst z && snd z < 4) y) x)
--3
doesContain :: String -> String -> Bool
doesContain [] _ = True
doesContain _ [] = False
doesContain (x:xs) (y:ys)
    | x == y = doesContain xs ys
    | otherwise = doesContain (x:xs) ys
--4
barbie :: [String] -> String
barbie = go 1
    where
        go :: Int -> [String] -> String
        go _ [] = "farmer"
        go n (x:xs)
            | x == "rozsaszin" = "rozsaszin"
            | x == "fekete" || mod n 2 == 1 = go (n + 1) xs
            | otherwise = x
--5
firstValid :: [a -> Bool] -> a -> Maybe Int
firstValid = go 0
    where
        go :: Int -> [a -> Bool] -> a -> Maybe Int
        go _ [] _ = Nothing
        go n (f:fs) x
            | f x = Just n
            | otherwise = go (n + 1) fs x
--6
combineListsIf :: (a -> b -> Bool) -> (a -> b -> c) -> [a] -> [b] -> [c]
combineListsIf _ _ [] _ = []
combineListsIf _ _ _ [] = []
combineListsIf f g (x:xs) (y:ys)
    | f x y = g x y : combineListsIf f g xs ys
    | otherwise = combineListsIf f g xs ys
--7
data Line = Tram Integer [String] | Bus Integer [String]
    deriving (Eq, Show)

whichBusStop :: String -> [Line] -> [Integer]
whichBusStop _ [] = []
whichBusStop x (y:ys)
    | isBus y && elem x (stops y) = number y : whichBusStop x ys
    | otherwise = whichBusStop x ys
    where
        stops :: Line -> [String]
        stops (Tram _ s) = s
        stops (Bus _ s) = s

        number :: Line -> Integer
        number (Tram n _) = n
        number (Bus n _) = n

        isBus :: Line -> Bool
        isBus (Bus _ _) = True
        isBus _ = False
--8
isReservable :: Int -> String -> Bool
isReservable = go 0
    where
        go :: Int -> Int -> String -> Bool
        go _ 0 _ = True
        go _ _ [] = False
        go n m (x:xs)
            | n == m = True
            | x == 'x' = go (n + 1) m xs
            | otherwise = go 0 m xs