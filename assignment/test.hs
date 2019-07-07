

transpose :: [[a]] -> [[a]]
transpose [] =[]
transpose list = map head list : transpose (map tail list)

data Tree a = Empty | Node (Tree a) a (Tree a)

treesort :: Ord a => [a] -> [a]
treesort xs = tree_inorder (list_to_bst xs)

list_to_bst :: Ord a => [a] -> Tree a
list_to_bst [] = Empty
list_to_bst (x:xs) = bst_insert x (list_to_bst xs)

bst_insert :: Ord a => a -> Tree a -> Tree a
bst_insert x Empty = Node Empty x Empty
bst_insert x (Node l m r) =
    if x < m then (Node (bst_insert x l) m r)
    else (Node l m (bst_insert x r))

tree_inorder :: Tree a -> [a]
tree_inorder Empty =[]
tree_inorder (Node l m r) = tree_inorder l ++ [m] ++ tree_inorder r

transpose1 :: [[a]] -> [[a]]
transpose1 [] = error "empty list"
transpose1 list@(xs:xss) 
    | len > 0 = transpose1' len list
    | otherwise = error "zero"
    where len = length xs

transpose1' :: Int -> [[a]] -> [[a]]
transpose1' len [] = replicate len []
transpose1' len (xs:xss) 
    | len == length xs = zipWith (:) xs (transpose1' len xss)
    | otherwise = error " non"


maybeApply :: (a->b) -> Maybe a -> Maybe b
maybeApply f Nothing = Nothing
maybeApply f (Just x) = Just (f x)

zwith :: (a -> b -> c) -> [a] -> [b] -> [c]
zwith f [] _ = []
zwith f _ [] = []
zwith f (x:xs) (y:ys) = (f x y) : (zwith f xs ys)

linearEqn :: Num a => a -> a -> [a] -> [a]
linearEqn m n = map (\x -> m*x+n) 


funca :: (Ord a, Floating a) => [a] -> [a]
funca [] =[]
funca list = map sqrt (filter (>= 0) list)

funcb :: (Ord a, Floating a) => [a] -> [a]
funcb [] = []
funcb (x:xs) =
    if x >= 0 then sqrt x : funcb xs
    else funcb xs


maybe_tail :: [a] -> Maybe [a]
maybe_tail [] = Nothing
maybe_tail (x:xs) = Just xs

maybe_drop :: Int -> [a] -> Maybe [a]
maybe_drop 0 xs = Just xs
maybe_drop n xs | n > 0 = maybe_tail xs >>= maybe_drop (n-1)

maybe_drop' :: Int -> [a] -> Maybe [a]
maybe_drop' 0 xs = Just xs
maybe_drop' n xs = | n > 0 =
    let mt = maybe_tail xs in
        case mt of
            Nothing -> Nothing
            Just xs1 -> maybe_drop (n-1) xs1

data Tree a = Empty | Node (Tree a) a (Tree a)
print_tree :: Show a => Tree a -> IO ()
print_tree Empty = return ()
print_tree (Node l m r) = do
    print_tree l
    print m
    print_tree r

str_to_num :: String -> Maybe Int
str_to_num [] = Nothing
str_to_num (x:xs) = str_to_num_acc 0 (x:xs)

str_to_num_acc :: Int -> String -> Maybe Int
str_to_num_acc n [] = Just n
str_to_num_acc n (x:xs) =
    if isDigit x then str_to_num_acc (10*n + digitToInt x) xs
    else Nothing

sum_lines :: IO Int
sum_lines = do
    line <- getLine
    case str_to_num line of
        Nothing -> return ()
        Just num -> do
            sum <- sum_lines
            return (sum+num)

data Ttree t = Nil | Node3 t (Ttree t) (Ttree t) (Ttree t)
aver :: Ttree Double -> Double
aver Nil = 0.0
aver (Node3 a left mid right) = 
    let (sum, count) = aver' (Node3 a left mid right) in
        sum/count

aver' :: Tree Double -> (Double, Double)
aver' Nil = (0.0, 0.0)
aver' (Node3 a left mid right) =
    let (sum1, count1) = aver' left
        (sum2, count2) = aver' mid
        (sum3, count3) = aver' right
    in (a+sum1+sum2+sum3, 1+count1+count2+count3)


