"Find the subsequence whose elements produce the largest sum. Print the subsequence
and print the sum. A 'subsequence' is defined as a sequence of contiguous elements
from the original collection.

For example, if the collection is:
( -12 1 4 -3 20 -1 -10 -2 )

Then the maximum subsequence sum is 22 (1 + 4 + -3 + 20):
( -12 1 4 -3 20 -1 -10 -2 )

Note: I’m not expecting anything asymptotically efficient here. A simple O(n2) nested
loop approach is just fine. You can try for the O(nlogn) divide and conquer algorithm,
but it’s not required."

"Use q1.st and q2.st"
| oc sumPos sumNeg |
oc := OrderedCollection new.
8 timesRepeat: [
  oc add: (-20 to: 20) atRandom.
].

sumPos := 0.
sumNeg := 0.
oc do: [ :i |
  [ i > 0 ] ifTrue: [ sumPos := sumPos + i ].
  [ i < 0 ] ifTrue: [ sumNeg := sumNeg + i ].
].
Transcript show: "Sum Positive: "; show: sumPos; cr.
Transcript show: "Sum Negative: "; show: sumNeg; cr.


"start q3.st here"
| currSum maxSum oc2 |
currSum := 0.
maxSum := 0.
1 to: oc size do: [ :i |
  currSum := 0.
  i to: oc size do: [ :j |
    currSum := currSum + (oc at: j).
    [ currSum > maxSum ] ifTrue: [ 
      maxSum := currSum.
      oc2 clear. 
      oc2 addAll: oc at: (i to: j).
    ].
  ].
].

Transcript show: "Largest Subsequence: "; show: oc2; cr.
Transcript show: "Sum of Largest Subsequence: "; show: maxSum; cr.


"alternate solution"
| max_sum left right s ocNew |
max_sum := oc at: 1.
left := 1.
right := 1.
1 to: oc size do: [ :l |
  l to: oc size do: [ :r |
    s := (oc copyFrom: l to: r) sum.
    s > max_sum ifTrue: [ max_sum := s. left := l. right := r. ]
  ].
].
ocNew := OrderedCollection new.
ocNew addAll: oc at: (left to: right).
Transcript show: "Largest Subsequence: "; show: ; cr.
Transcript show: "Sum of Largest Subsequence: "; show: maxSum; cr.
