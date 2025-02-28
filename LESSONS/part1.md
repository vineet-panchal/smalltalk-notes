# Intro To SmallTalk

###### - everything is an object
###### - everythibng is an instance of a corresponding class

### A SmallTalk object can do three things:
###### 1. Hold state (assignment)
###### 2. Receive a message (from itself or another object)
###### 3. Send message (to itself or another object)

### When an Object receives a message:
###### - search the object's class for an appropiate method to call with the message
###### - if the method is found, call it with the message as an argument
###### - if the method is not found, check the superclass
###### - repeat until method is found, or we get class "Object"
###### - still not found? throw exception

## Pharo - SmallTalk IDE

### Class Browser
###### - shows all classes in the system
###### - can create new classes, methods, and variables

### Playground Window
###### - SmallTalk code goes here

### Transcript Window
###### - output is printed here

## Getting Started With SmallTalk
```
Transcript show: 'Hello World'.
```
###### - prints "Hello World" to Transcript Window
```
| x |
x := 16 sqrt.
Transcript show: x.
```
###### - prints the square root of 16 to Transcript Window
###### - variable x is local to the block
###### - the message sqrt is sent to the object 16

### Unary Messages
###### - unary message are any messages without arguments
###### Ex: sqrt, squared, asInteger, class, cr, floor, ceiling, sin, cos, tan

### Binary Messages
###### - binary messages are strictly between two messages
###### Ex: +, -, *, /, //, \\, =, ==, <, <=, >= , >
###### Ex: x := 3 + 4.

### Keyword Messages
###### - keyword messages can contain any number of arguments
###### - keyword messages must include a colon
###### Ex: x := 2 raisedTo: 4.
###### - 2 is the receiving object, raisedTo: is the message, 4 is the argument

### Multiple Arguments
###### - SmallTalk interleaves arguments
###### Ex: x := 'Hello' indexOf: $o startingAt: 2.
###### - the actual message is indexOf:startingAt:

### SmallTalk Literals
###### Numbers: 42, 042, 123.45, 1.2345e2, 2100100010, 164000
###### Strings: 'Hello World' - denoted by single quotes
###### Characters: $A, $8, $? - denoted by a $
###### Symbols: #hello, #world - denoted by a #
###### Booleans: true, false
###### Comments: "This is a comment" - denoted by double quotes

## Arrays
##### Array Of Literals(static)
###### - elements are seperated by a space
###### - can contain any object
##### Array Of Variables(dynamic)
###### - defined by curly braces, period between elements
```
"Playground"
| arrLiterals1 arrLterals2 a b c d e arr |
a := 2. b := 4. c := 6. d := 8. e := 10.
arrLiterals1 := #(1 2 3 4 5).
arrLiterals2 := #(1 2.0 'Hello' #('World')).
arr := {a . b . c . d . e}.
Transcript show: arrLiterals1; cr. 
Transcript show: arrLiterals2; cr.
Transcript show: arr; cr.
Transcript show: arr class. 
```
```
"Transcript"
#(1 2 3 4 5)
#(1 2.0 'Hello' #('World'))
#(2 4 6 8 10)
Array
```
