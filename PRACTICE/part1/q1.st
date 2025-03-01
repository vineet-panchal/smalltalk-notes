"Start by creating an OrderedCollection and filling it with eight random SmallIntegers
whose values are between -20 and 20, inclusive. Print the OrderedCollection to the
Transcript."

"Hint: One way to generate random numbers is to use the atRandom unary message. Try
passing it to an Array or collection and printing the result."

| oc |
oc := OrderedCollection new.
8 timesRepeat: [
  oc add: (-20 to: 20) atRandom.
].
Transcript clear; show: oc; cr.