"Find and print the sum of the positive integers, and the sum of the negative integers."
"Use q1.st"
| oc |
oc := OrderedCollection new.
8 timesRepeat: [
  oc add: (-20 to: 20) atRandom.
].


"start q2.st here"
| sumPos sumNeg |
sumPos := 0.
sumNeg := 0.
oc do: [ :i |
  [ i > 0 ] ifTrue: [ sumPos := sumPos + i ].
  [ i < 0 ] ifTrue: [ sumNeg := sumNeg + i ].
].
Transcript show: "Sum Positive: "; show: sumPos; cr.
Transcript show: "Sum Negative: "; show: sumNeg; cr.


"alternate solution"
| sp sn |
sp := (oc select: [ :e | e >= 0 ]) sum.
sn := (oc select: [ :e | e < 0 ]) sum.
Transcript show: "Sum Positive: "; show: sp; cr.
Transcript show: "Sum Negative: "; show: sn; cr.

