module Test where

import Data.Maybe

sumlist :: (Num a) => [a] -> a
sumlist [] = 0
sumlist (x:xs) = x + sumlist xs


test :: (Eq a,Num a) => a -> Bool
test x
    |x == 0 = True
    |otherwise = False

len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs

data Suit = Club | Diamond | Heart | Spade
data Rank = R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | Jack | Queen | King | Ace
data Card = Card Suit Rank
data JokerColor = Red | Black
data JCard = NormalCard Suit Rank | JokerCard JokerColor 

data LibraryItem = 
    Book Integer String String
    | Periodical Integer String Period

data Period = Days Integer | Months Integer

title (Book _ title _) = title
title (Periodical _ title _) = title


data Tree k v= Leaf | Node k v (Tree k v) (Tree k v) deriving Show

countnodes :: Tree k v -> Int
countnodes Leaf = 0
countnodes (Node _ _ l r) = 1 + (countnodes l) + (countnodes r)

l1 = Leaf
l2 = Leaf
t1 = Node "t1" 1 tl tr
tl = Node "tl" 2 l1 Leaf
tr = Node "tr" 3 Leaf l2

search_bst :: Ord k => Tree k v -> k -> Maybe v
search_bst Leaf _ = Nothing
search_bst (Node k v l r) sk =
    if sk == k then Just v
    else if sk < k then search_bst l sk
    else search_bst r sk

-- insert_bst :: Tree -> String -> Int -> Tree
-- insert_bst Leaf ik iv = Node ik iv Leaf Leaf
-- insert_bst (Node k v l r) ik iv =
--     if ik == k then Node ik iv l r
--     else if ik < k then Node k v (insert_bst l ik iv) r
--     else Node k v l (insert_bst r ik iv)






nonNegFlts :: (Ord a, Num a) => [a] -> [a]
nonNegFlts [] =[]
nonNegFlts (x:xs)
    |x<0 = nonNegFlts xs
    |otherwise = x : (nonNegFlts xs)

sublists :: [a] -> [[a]]
sublists [] = [[]]
sublists (x:xs) = addToEach x restlist ++ restlist
    where restlist = sublists xs

addToEach :: a -> [[a]] -> [[a]]
addToEach x [] = []
addToEach x (y:ys) = (x:y) : (addToEach x ys)

insertList :: Ord a => a -> [a] -> [a]
insertList elt [] = [elt]
insertList elt (x:xs) =
    if x < elt then x : insertList elt xs
    else elt:x:xs


data BoolExpr
    = BoolConst Bool
    | BoolOp BoolOp BoolExpr BoolExpr
    | CompOp CompOp IntExpr IntExpr

data IntExpr
    = IntConst Int
    |IntOp IntOp IntExpr IntExpr
    |IntIfThenElse BoolExpr IntExpr IntExpr

data BoolOp = And
data CompOp = LessThan
data IntOp = Plus | Times

boolExprValue :: BoolExpr -> Bool
boolExprValue (BoolConst b) = b
boolExprValue (BoolOp And e1 e2) = boolExprValue e1 && boolExprValue e2
boolExprValue (CompOp LessThan e1 e2) = intExprValue e1 < intExprValue e2

intExprValue :: IntExpr -> Int
intExprValue (IntConst i) = i
intExprValue (IntOp Plus e1 e2) = intExprValue e1 + intExprValue e2
intExprValue (IntOp Times e1 e2) = intExprValue e1 * intExprValue e2
intExprValue (IntIfThenElse b e1 e2) =
    if boolExprValue b then intExprValue e1
    else intExprValue e2

iseven :: Int -> Bool
iseven x = x `mod` 2 == 0

together :: Num a => [a] -> [a]
together [] = []
together (x:xs) = (x-3):(together xs)

data Customer = Customer {
                name :: String,
                number :: Int
} deriving Show

customername :: Customer -> String
customername (Customer a _) = a

getnames :: [Customer] -> [String]
getnames customers = map customername customers

getnames2 :: [Customer] -> [String]
getnames2 = map name

getnum :: Customer -> Int
getnum (Customer _ a) = a

getnums :: [Customer] -> [Int]
getnums = map number

a = Customer "A" 1
b = Customer "B" 2
c = Customer "C" 3

customerlist = [a,b,c]




sum1 :: Num a => [a] -> a
sum1 = foldl (+) 0

product1 :: Num a => [a] -> a
product1 = foldl (*) 1

concat1 :: [[a]] -> [a]
concat1 = foldl (++) []

foldb :: (e -> e -> e) -> e -> [e] -> e
foldb _ b [] = b
foldb _ _ (x:[]) = x
foldb f b l@(_:_:_) =
    let
        len = length l
        (half1, half2) = splitAt (div len 2) l
        value1 = foldb f b half1
        value2 = foldb f b half2
    in
        f value1 value2

sumb :: Num a => [a] -> a
sumb = foldb (+) 0


equal :: Eq a => a -> a -> Bool
equal a b = a == b

htest :: Floating a => [a] -> a
htest list = sqrt (sum (map (^2) list))

htest2 :: Floating a => [a] -> a
htest2 = sqrt.sum.map (^2)

const1 :: a -> b -> a
const1 a b = a

length1 :: [a] -> Int
length1 = foldr ((+).const1 1) 0

rev :: [a] -> [a]
rev [] = []
rev [x] = [x]
rev (x:xs) = (rev xs) ++ [x]

snoc :: [a] -> a -> [a]
snoc tl hd = hd:tl

rev1 :: [a] -> [a]
rev1 = foldl snoc []

