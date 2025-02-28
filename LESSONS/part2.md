# SmallTalk

## Symbols
###### - symbol objects are globally unique, Strings are not.
###### - followed by a string literal
###### Ex: #'aSymbol' is the same as #aSymbol (quotes implied)
###### - two identical strings can exist as two seperate objects
###### - for every unique symbol value, there can only be one object
###### MESSAGES ARE SYMBOLS

## Blocks
###### - defined with square brackets [], SmallTalk code inside
###### - to execute a block, pass it the "value" message
###### BLOCKS ARE OBJECTS, they may be assigned a variable

### Blocks as Anonymous Functions
```
func := [ :x | Transcript show: x; cr. ].
func value: 27.
```
###### - arguments can be passed in when we send the keyword value: message
```
"Playground" 
| tc ts | 
tc := [ Transcript clear ].
ts := [ :a :b | Transcript show: a + b; cr. ].
tc value.
ts value: 1 value: 2. 
ts value: 3 value: 4.
```
```
"Transcript"
3 
7
```

## Control Structures: Branching/Selection
### ifTrue:
###### - they are implemented using blcoks and message passing
###### - a true object receives ifTrue: message
###### - it sends the value message to the argument and the value message executes a block
###### - it must evaluate to something, else block evalues to nil
###### Ex: 7 > 4 ifTrue: [ Transcript show: 'This is true' ].

### ifTrue:ifFalse:
###### - takes in two arguments
###### - the block that gets executed depends on whether the message is sent to a true or false object.
```
"Playground"
| val |
val := 4 > 7 ifTrue: [ 'This is true' ] ifFalse: [ 'This is false' ].
Transcript show: val; cr.
Transcript show: val class; cr.
```
```
"Transcript" 
This is false
ByteString
```

## Repetition Using Messages & Blocks
### whileTrue: 
###### - message sent to blcok containing Boolean expression
###### - the argument that accompanies the whileTrue message is a blcok containing code to be repeated
###### Ex: [ x > 0 ] whileTrue: [ x := x - 1. y := y + 2 ].

### whileFalse: 
###### - message sent ot block containing Boolean expression (false)

### timesRepeat: 
###### - repeat the amount of times as suggested by the Integer object
```
"Playground"
| x y |
x := 10. y := 0.
Transcript clear. 
x timesRepeat: [
  Transcript show: (2 raisedTo: y); cr.
  y := y + 1.
]
```
```
"Transcript"
1
2
4
8
16
32
64
128
256
512
```
### to:do: 
###### - for-loop equivalent for SmallTalk, wrapper for whileTrue:
###### - needs a loop index, any variable
```
"Playground"
| x |
x := 6.
Transcript clear. 
1 to: x do: [ :a | "a is the loop index, can be used in the block" 
  Transcript show: (2 raisedTo: a); cr.
].
```
```
"Transcript"
2
4
8
16
32
64
```
### do: 
###### - used to iterate over arrays/lists, send do: message to an array object with block as argument.
###### - blcok argument is each array element, also works with other collections
```
"Playground"
| x sum |
x := (1 2 3 4 5 6 7 8 9 10).
sum := 0.
x do: [ :a | sum := sum + a ].
Transcript clear; show: sum; cr.
```
```
"Transcript"
55
```

## Collections
### OrderedCollection
###### - acts as an expandable array (arraylist)
###### - can initailize as empty, can be heterogeneous
```
"Playground"
| oc1 oc2 oc3 | 
oc1 := OrderedCollection new.
oc2 := OrderedCollection with: 1 with: 2 with: 3.
oc3 := OrderedCollection with: 1 with: $A.
Transcript clear; show: oc1 oc2 oc3; cr.
```
```
"Transcript"
an OrderedCollection()
an OrderedCollection(1 2 3)
an OrderedCollection(1 $A)
```
##### add:
###### - add elements to an OrderedCollection object, argument is object to append.
##### addFirst:
###### - add to the front of the OrderedCollection
##### at:put:
###### - put elements at certain indexes, argument 1 is the index
##### addAll: 
###### - add the elements of an array to the end of OrderedCollection
##### removeFirst:
###### - remove the first element of the OrderedCollection.
##### removeLast:
###### - remove the last element of the OrderedCollection.
##### removeAll: 
###### - removes all values matching the argument.
##### removeAt:
###### - removes the element at the specified index.
```
"Playground"
| oc1 oc2 |
oc1 := OrderedCollection new.
oc2 := OrderedCollection new.
oc1 add: 3; add: 2; add: 1.
oc1 addFirst: 'Hello'.
oc1 addFirst: #($a, $b).
Transcript clear; show: oc1; cr.
oc2 addAll: #(1 2 3 4 5).
oc2 at: 2 put: 9.
Transcript show: oc2; cr.
oc1 removeFirst; removeLast;
Transcript show: oc1; cr. 
oc2 removeAll: #(3 4 5).
Transcript show: oc2; cr.
oc1 removeAt: 1.
Transcript show: oc1; cr.
```
```
"Transcript"
an OrderedCollection(#($a, $b) 'Hello' 3 2 1)
an OrderedCollection(1 9 3 4 5)
an OrderedCollection('Hello' 3 2)
an OrderedCollection(1 9)
an OrderedCollection(3 2)
```
##### select:
###### - filter collection based on some criteria
###### - result is a collection containing elements that pass the condition.
##### reject:
###### - filter collection based on some criteria
###### - remove element, that pass the condition
```
"Playground"
| oc1 oc2 oc1Select oc2Select | 
oc1 := OrderedCollection new.
oc2 := OrderedCollection new.
oc1 addAll: #(1 2 3 4 5 6 7 8 9).
oc2 addAll: #(1 2 3 4 5 6 7 8 9). 
oc1Select := oc1 select: [ :a | a \\ 2 = 0 ].
oc2Select := oc2 select: [ :a | a \\ 2 = 0 ].
Transcript clear; show: oc1; cr. Transcript show: oc2; cr.
```
```
"Transcript"
an OrderedCollection(2 4 6 8)
an OrderedCollection(1 3 5 7 9)
```
##### collect: 
###### - transform each element in collection by performing an operation
```
"Playground"
| oc | 
oc := OrderedCollection new.
oc addAll: #(1 2 3 4 5 6 7 8 9).
Transcript clear; show: oc; cr.
oc collect: [ :a | a * 2 ].
Transcript show: oc; cr.
oc := oc collect: [ :a | a * 2 ].
Transcript show: oc; cr.
```
```
"Transcript"
an OrderedCollection(1 2 3 4 5 6 7 8 9)
an OrderedCollection(1 2 3 4 5 6 7 8 9)
an OrderedCollection(2 4 6 8 10 12 14 16 18)
```

### SortedCollection
###### - similar to an OrderedCollection but sorted
###### - specify a sorting criteria for operations
###### - a blcok with two inputs that implements a Boolean condition
###### - define the condition for element a, appearing before element b in the sequence
###### - if blcok is true, element a comes first
```
"Playground"
| sc |
sc := SortedCollection new.
sc addAll: #(7 4 6 8 7 5).
Transcript show: sc; cr.
sc sortBlock: [ :a :c | a > c ].
Transcript show: sc; cr.
sc add: 9. Transcript show: sc; cr.
```
```
"Transcript"
a SortedCollection(4 5 6 7 7 8)
a SortedCollection(8 7 7 6 5 4)
a SortedCollection(9 8 7 7 6 5 4)
```

```
"Playground"
| sc |
sc := SortedCollection new.
sc := SortedCollection sortBlock: [ :a :c | a \\ 2 = 0 ].
sc addAll: #(1 2 3 4 5 6 7 8).
Transcript clear; show: sc; cr. 
```
```
"Transcript"
a SortedCollection(8 2 6 4 7 3 5 1)
```

### Sets
###### - a collection of unique elements, no duplicate values
```
"Playground"
| s |
s := Set new.
s add: 3; add: 3; add: 3; add: 'Hello'; add: ('Hel', 'lo').
Transcript clear; show: s; cr.
Transcript show: s1 size; cr.
```
```
"Transcript"
a Set(3, 'Hello')
2
```

```
"Playground"
| s oc sc |
oc := OrderedCollection withAll: #(4 4 2 3 2 9 9 8 1).
Transcript clear; show: oc; cr.
sc := oc asSortedCollection.
Transcript show: sc; cr.
s := sc asSet.
Transcript show: s; cr.
```
```
"Transcript"
an OrderedCollection(4 4 2 3 2 9 9 8 1)
a SortedCollection(1 2 2 3 4 4 8 9 9)
a Set(1 2 3 4 8 9)
```

### Dictionary
###### - dictionary can be indexed by any hashable object
###### - store key/value pairs, key can be anything

##### at:put:
###### - put key/value pairs in the hash table/dictionary
##### at:
###### - search for keys to get their values
```
"Playground"
| d |
d := Dictionary new.
d at: 'One' put: 1. d at: 'Two' put: 2.
d at: 1 put: 'One'. d at: 2 put: 'Two'.
Transcript clear; show: (d at: 2); cr.
Transcript show: (d at: 'One'); cr.
```
```
"Transcript"
Two
1
```

## Creating Classes
###### - go to the system browser
###### - right-click anywhere in the left column with all the folders
###### - select "New Package"
###### - under "New Class" is a class template
###### - give it a classname with a "#" in front of it
###### - Ctrl+S to save the class
###### - you can create instance/class side methods and variables

###### Ex: creating an instance side method in class: Crag
```
firstMessage: num "keyword message, one argument"
  | sum | "one local variable" 
  sum := num + 5.
  ^sum "return object"
```
###### - Ctrl+S to save and create the instance method
###### - you can now use class: Crag, and instance method: firstMessage
``` 
"Playground"
| cr res |
cr := Crag new. 
res := cr firstMessage: 7.
Transcript clear; show: res; cr.
```
```
"Transcript"
12
```
