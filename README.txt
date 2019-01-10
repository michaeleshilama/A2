Author: Malik Lewis 100990127 November 10, 2017

Source Files: comp3007_f18_100990127_a3.hs README.txt

Compilation command: ghci -> :l comp3007_f18_100990127_a3

Question 1:

pseudoRand' is a helper function to provide an int between 1-10.
pseudoRand takes in an int and returns a float between 0 and 1.
Example: pseudoRand 7
=> 0.1

Question 2:

Tree is the constructed data structure to represent the simple arithmetic expressions.

Question 3.1 

Evaluates an expression including an unknown variable, with a Float to be subed in for said variable.
Example: eval (Add (Num 2) (x)) 2
=> 4.0

Question 3.2
Display the string representation of the function which converts an arithmetic expression.
Example: print (Add (Times (Num 3) (X)) (Num 4))
=> "3.0X + 4.0"

Question 3.3
Display a visual binary tree to represent the passed in expression.
Example: Prelude.putStrLn $ visualTree (Times (Num 3) (Add (X) (Num 3))) 1
=> (*) ---3.0
		   |
		   ----(+) ---x
				   |
				   ----3.0
