Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbIfElseNode >> executeIn: anEnvironment [

(condition evaluateIn: anEnvironment )ifTrue:[trueStatements allButLast do:[:a | a executeIn:anEnvironment  ].
	^trueStatements last executeIn: anEnvironment.]

     ifFalse:[falseStatements allButLast do:[:b | b executeIn: anEnvironment ].
	   ^ falseStatements last executeIn: anEnvironment.]. 
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
