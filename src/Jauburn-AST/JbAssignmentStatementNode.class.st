Class {
	#name : #JbAssignmentStatementNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'expression'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbAssignmentStatementNode >> evaluateIn: anEnvironment [


^self executeIn: anEnvironment.
]

{ #category : #'as yet unclassified' }
JbAssignmentStatementNode >> executeIn: anEnvironment [

  anEnvironment lookupAt: self identifier put: (expression evaluateIn: anEnvironment ).
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression [
	^ expression
]

{ #category : #accessing }
JbAssignmentStatementNode >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbAssignmentStatementNode >> identifier: anObject [
	identifier := anObject
]
