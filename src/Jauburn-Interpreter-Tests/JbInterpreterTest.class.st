Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #tests }
JbInterpreterTest >> testAbsPrimitive [

self interpret: 'var abs =  abs(-3);'.

self assert: (interpreter environment at: 'abs') equals: 3.
]

{ #category : #tests }
JbInterpreterTest >> testArity1Operator [

self interpret:  'var c = -1;'.
	self assert:  (interpreter environment at: 'c') equals: -1.
]

{ #category : #tests }
JbInterpreterTest >> testArity2Operator [


    self interpret:  'var c = 3 < 1;'.
	self assert:  (interpreter environment at: 'c') equals: false.
	 self interpret: 'var d = 4 > 2;'.
	self assert: (interpreter environment at: 'd') equals: true.
    self interpret: 'var a =  4 == 3;'.
    self assert: (interpreter environment at: 'a') equals: false.
    self interpret: 'var a =  4 == 4;'.
    self assert: (interpreter environment at: 'a') equals: true.
        
    self interpret: 'var j =  4 != 1;'.
     self assert: (interpreter environment at: 'j') equals: true.
	
	 self interpret: 'var j =  4 <= 4;'.
	
	     self assert: (interpreter environment at: 'j') equals: true.
	self interpret: 'var x = 6;var y = 2*x;'.
	
	self assert: (interpreter environment at: 'y') equals: 12
]

{ #category : #tests }
JbInterpreterTest >> testConcatPrimitive [

self interpret: 'var a = concat("hello","good");'.
self assert: (interpreter environment at: 'a') equals: 'hellogood'.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12.
	
   self interpret: 'var alpha = 12; var x = alpha / 4;'.
   self assert: (interpreter environment at: 'x') equals: 3.

self interpret: 'var alpha = 12; var x = alpha != 12;'.
   self assert: (interpreter environment at: 'x') equals: false.

self interpret: 'var alpha = 12; var x = alpha == 4;'.
   self assert: (interpreter environment at: 'x') equals: false.

self interpret: 'var alpha = 12; var x = alpha > 4;'.
   self assert: (interpreter environment at: 'x') equals: true.

self interpret: 'var alpha = 12; var x = alpha >= 4;'.
   self assert: (interpreter environment at: 'x') equals: true.

self interpret: 'var alpha = 12; var x = alpha <=  4;'.
   self assert: (interpreter environment at: 'x') equals: false.
self interpret: 'var alpha = -12;'.
   self assert: (interpreter environment at: 'alpha') equals: -12.
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [ 

|a|
     self interpret: 'var b = 0;'.
     self interpret: ' var a = function() {b = 1;};'.
     self interpret: 'a();'.

  self assert:  (interpreter environment  at: 'b')  equals: 1.
  self interpret: 'var c = function() { b = 5 + 1;};'.
  self interpret: 'c();'.
 self assert: (interpreter environment at: 'b') equals: 6.

  self interpret: 'var c = function() { return 5 + 1;};'.
  self interpret: 'var val = c();'.
 self assert: (interpreter environment at: 'val') equals: 6.
]

{ #category : #tests }
JbInterpreterTest >> testIf [ 


self interpret: 'var iffy = 10; if (iffy > 1) {iffy = true;}'.

self assert: (interpreter environment at: 'iffy') equals: true.
]

{ #category : #tests }
JbInterpreterTest >> testInputPrimitive [

 |userInt|

  userInt := MockUIManager new.

  interpreter ui: userInt.
  
  self interpret: 'var user = input("hello");'.

  self assert: (interpreter ui content) equals: 'hello'.
]

{ #category : #tests }
JbInterpreterTest >> testLengthPrimitive [

self interpret: 'var len = length("apple");'.

self assert: (interpreter environment at: 'len') equals: 5.
]

{ #category : #tests }
JbInterpreterTest >> testModPrimitive [
self interpret: 'var mod =  mod(3,2);'.

self assert: (interpreter environment at: 'mod') equals: 1.
]

{ #category : #tests }
JbInterpreterTest >> testNotPrimitive [

self interpret: 'var not = not(false);'.

self assert: (interpreter environment at: 'not') equals: true.
]

{ #category : #tests }
JbInterpreterTest >> testPrintPrimitive [

|trans|

trans := MockTranscript new.

interpreter transcript: trans.

self interpret: 'print("good bye");'.

self assert: (interpreter transcript contents) equals: 'good bye'.
]

{ #category : #tests }
JbInterpreterTest >> testPrintlnPrimitive [
|userInput|

 userInput := Transcript.

 interpreter transcript: userInput.

self interpret: 'println("high hopes");'.
self assert:(interpreter transcript content) equals: ('high hopes').



]

{ #category : #tests }
JbInterpreterTest >> testWhile [ 

 self interpret: 'var whily = 1;  
     var after = 1;
     while( after <=  9){
         whily = after + whily + 1;

          after = after + 1;
}'.

 self assert: (interpreter environment at: 'whily') equals: 55.
]

{ #category : #'as yet unclassified' }
JbInterpreterTest >> testifElse [

self interpret: 'var answer = 12; if (answer == 12) {answer = false;} else {answer = true;}'.
self assert: (interpreter environment at: 'answer') equals: false.
]
