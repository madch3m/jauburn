Class {
	#name : #JbReturnStatementNode,
	#superclass : #Object,
	#instVars : [
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbReturnStatementNode >> evaluateIn: anEnvironment [

^self executeIn: anEnvironment.
]

{ #category : #'as yet unclassified' }
JbReturnStatementNode >> executeIn: anEnvironment [

^ expression evaluateIn: anEnvironment 
]

{ #category : #accessing }
JbReturnStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbReturnStatementNode >> expression: anObject [
	expression := anObject
]
