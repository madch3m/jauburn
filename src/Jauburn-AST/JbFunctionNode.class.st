Class {
	#name : #JbFunctionNode,
	#superclass : #Object,
	#instVars : [
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionNode >> body: anObject [
	body := anObject
]

{ #category : #'as yet unclassified' }
JbFunctionNode >> evaluateIn: environment [
  


^JbFunction new

   body: self body;
     parameters: self parameters;
      environment: environment;
      yourself.
     

 

]

{ #category : #accessing }
JbFunctionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionNode >> parameters: anObject [
	parameters := anObject
]
