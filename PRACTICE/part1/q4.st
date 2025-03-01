"Create a new OrderedCollection from the original, where all the negative numbers are
on the left, and all positive numbers are on the right. However, the relative ordering of
positive and negative values remains the same (i.e. don’t simply sort the collection).
Print the new collection.

For example, if the OrderedCollection is:
( -12 1 4 -3 20 -1 -10 -2 )

Then the new OrderedCollection would be:
( -12 -3 -1 -10 -2 1 4 20 )"

"Use q1.st"
| oc |
oc := OrderedCollection new.
8 timesRepeat: [
  oc add: (-20 to: 20) atRandom.
].
Transcript clear; show: oc; cr.


"start q4.st here"
| oc3 |
oc := OrderedCollection new.
oc do: [ :i |
  [ i < 0 ] ifTrue: [ oc3 add: i ].
].
oc do: [ :i |
  [ i > 0 ] ifTrue: [ oc3 add: i ].
].
Transcript show: oc3; cr.


"alternate solution"
| oc_sort | 
oc_sort := oc select: [ :e | e < 0 ].
oc_sort addAll: (oc select: [ :e | e > 0 ]).
Transcript show: oc_sort; cr.