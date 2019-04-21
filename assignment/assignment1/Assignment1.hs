--author: Qielu Yu
--Student Number: 962682
--username: qieluy
--the code of COMP90048 Assignment1, which contains three methods.

module Assignment1 (subst, interleave, unroll) where

subst :: Eq t => t -> t -> [t] -> [t]
subst a b [] = []
subst a b (x:xs) = if x == a then b:(subst a b xs) 
    else x:(subst a b xs)

interleave :: [t] -> [t] -> [t]
interleave [] [] = []
interleave (x:xs) [] = (x:xs)
interleave [] (x:xs) = (x:xs)
interleave (x:xs) (e:es) = x:(interleave (e:es) xs)

unroll :: Int -> [a] -> [a]
unroll n [] = []
unroll 0 (x:xs) = []
unroll 1 [x] = [x]
unroll n (x:xs) = if n < (length (x:xs)) then x:(unroll (n - 1) xs)
    else (x:xs) ++ (unroll (n - length (x:xs)) (x:xs))