"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'transcript',
		'ui'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #'as yet unclassified' }
JbInterpreter >> absBinding [ 
^ #abs -> [ :a | a abs ]
]

{ #category : #'as yet unclassified' }
JbInterpreter >> concatBinding [ 
	
	^#concat -> [ :a1 :a2 |
		
		(a1 isString 
		  ifTrue: [ a1 ]
		  ifFalse: [ a1 printString ]),
		  (a2 isString 
		       ifTrue:[a2]
		       ifFalse: [a2 printString ]).]
	
		
		
		
		
		 
	
	
	
	 
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #accessing }
JbInterpreter >> environment: anObject [
	environment := anObject
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	self initializeBindings.
]

{ #category : #initialization }
JbInterpreter >> initializeBindings [

(self class selectors select: [ :each | each endsWith: 'Binding' ])
do: [ :s |
| val binding |
binding := self perform: s.
val := JbPrimitive new.
val block: binding value.
self environment at: binding key put: val  ].
]

{ #category : #printing }
JbInterpreter >> inputBinding [ 

^#input -> [ :value | 
	|inputCatch|
	inputCatch := self ui entry: value.
	
	]
	
	
	


]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #printing }
JbInterpreter >> lengthBinding [

^#length -> [ :a | a size ].
	
	
	


]

{ #category : #printing }
JbInterpreter >> modBinding [

^#mod -> [ :a1 :a2 | a1 \\ a2 ]
	
	
	


]

{ #category : #printing }
JbInterpreter >> notBinding [

	^#not -> [ :a | a not ]
	

	
	
	


]

{ #category : #printing }
JbInterpreter >> printBinding [ 

 ^#print -> [ :value | self transcript show: value ].
	
	

]

{ #category : #printing }
JbInterpreter >> printlnBinding [

^#println -> [ :value| self transcript show: value ]
	
	

]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #accessing }
JbInterpreter >> stringNumberBinding [

^ #stringToNumber -> [ :value|
	value asNumber
	
	 ]
]

{ #category : #accessing }
JbInterpreter >> transcript [
	^ transcript 
]

{ #category : #accessing }
JbInterpreter >> transcript: anObject [
	transcript := anObject
]

{ #category : #accessing }
JbInterpreter >> ui [
	^ ui ifNil: [ MorphicUIManager new. ]
]

{ #category : #accessing }
JbInterpreter >> ui: anObject [
	ui := anObject
]
