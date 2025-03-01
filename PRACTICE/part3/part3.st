
q1
	"
	Which of the following classes will understand the sqrt message?
	1)	SmallInteger
	2)	BlockClosure
	3)	True
	4)	Boolean
	5)	More than one of these
	"
	
	^1 "Modify this line, return 1-5 depending on your answer"



q2: num
	
	"
	Assume that the input argument to this method is an integer.
   Return the leftmost digit of that integer. For example, 
   if number is 523, then return 5. If number is -52, return 5. 
   If number is 0, return 0.
	"
	| num2 |
  num2 := num abs.

  [num2 >= 10] whileTrue: [ 
       num2 := num2 // 10.
  ].
  ^ num2 asInteger.

 

q2: n
	
	"
	How many integers, strictly less than input argument n, don't contain
   the same digit more than once? For example, 989 contains
   the digit 9 twice, but 567 has no duplicate digits.
	"
	
	| numString setString count |

  count := 0.

  (0 to: n - 1) do: [ :i | 
      numString := i printString.
      setString := numString asSet.
      ((numString size) = (setString size)) ifTrue: [ count := count + 1 ].
  ].

  ^ count.