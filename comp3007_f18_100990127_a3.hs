import Data.Maybe

-- Question 1
--random int between 1 and 10
pseudoRand' :: Int -> Int
pseudoRand' x = (((x `mod` 101)*6)-1) `mod` 10

--random float between 0 and 1
pseudoRand :: Int -> Float
pseudoRand x = fromIntegral(pseudoRand' x)/10

-- Question 2
-- Data structure to represent the simple arithmetic expressions.
data Tree =  X | Num Float | Add Tree Tree | Minus Tree Tree | Times Tree Tree | Div Tree Tree deriving (Show, Eq)

-- Question 3.1
-- Substitute a float into the value of either a or b if they are a literal X.

-- eval' is a helper function to evaluate the expression
eval' :: Tree -> Float 
eval' (Num a)=   a
eval' (Add a b) = eval' a + eval' b
eval' (Minus a b) = eval' a - eval' b
eval' (Times a b) = eval' a * eval' b
eval' (Div a b)
    | b == Num 0 = error "Cannot divide by zero"
    | otherwise = eval' a / eval' b 

eval :: Tree -> Float -> Float
eval (Num a) b = a
eval (X) b = eval' (Num b)
eval (Add (a) (b)) c
  | a == X && b == X = eval' (Add (Num c) (Num c))
  | a == X = eval' (Add (b) (Num c))
  | b == X = eval' (Add (a) (Num c))
  | otherwise = eval' (Add a b)
eval (Minus (a) (b)) c
  | a == X && b == X = eval' (Minus (Num c) (Num c))
  | a == X = eval' (Minus (b) (Num c))
  | b == X = eval' (Minus (a) (Num c))
  | otherwise = eval' (Minus a b)
eval (Times (a) (b)) c
  | a == X && b == X = eval' (Times (Num c) (Num c))
  | a == X = eval' (Times (b) (Num c))
  | b == X = eval' (Times (a) (Num c))
  | otherwise = eval' (Times a b)
eval (Div (a) (b)) c
  | a == X && b == X = eval' (Div (Num c) (Num c))
  | a == X = eval' (Div (b) (Num c))
  | b == X = eval' (Div (a) (Num c))
  | otherwise = eval' (Div a b)

-- Question 3.2
-- String representation function for converting an arithmetic expression.

printOut :: Tree -> String
printOut X = "X"
printOut (Num a) = show a 
printOut (Add a b) = printOut a ++ "+" ++ printOut b
printOut (Minus a b) = printOut a ++ "-" ++ printOut b
printOut (Times a b) 
  | a == X || b == X = printOut a ++ "" ++ printOut b
  | otherwise = printOut a ++ "*" ++ printOut b
printOut (Div a b) = printOut a ++ "/" ++ printOut b

-- Question 3.3
-- Visual representation of binary tree

-- helper function to determine number of tabs
numTabs :: Int -> [Char]
numTabs 0 = []
numTabs node = "\t" ++ numTabs (node-1)

visualTree :: Tree -> Int -> String
visualTree (X) _ = "x"
visualTree (Num a) _ = show a
visualTree (Add a b) node = "(+) ---" ++ visualTree a (node+1) ++ "\n" ++ numTabs node ++ "|" ++ "\n" ++ numTabs node ++ "----" ++ visualTree b (node+1) 
visualTree (Times a b) node = "(*) ---" ++ visualTree a (node+1) ++ "\n" ++ numTabs node ++ "|" ++ "\n" ++ numTabs node ++ "----" ++ visualTree b (node+1) 
visualTree (Div a b) node = "(/) ---" ++ visualTree a (node+1) ++ "\n" ++ numTabs node ++  "|" ++ "\n" ++ numTabs node ++ "----" ++ visualTree b (node+1) 

