Class {
	#name : #JbWhileLoopStatementNode,
	#superclass : #Object,
	#instVars : [
		'trueStatements',
		'condition'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileLoopStatementNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopStatementNode >> condition: anObject [
	condition := anObject
]

{ #category : #'as yet unclassified' }
JbWhileLoopStatementNode >> executeIn: anEnvironment [
[(condition evaluateIn: anEnvironment )] whileTrue:[trueStatements do:[:each | each executeIn: anEnvironment ]. ]

]

{ #category : #accessing }
JbWhileLoopStatementNode >> trueStatements [
	^ trueStatements
]

{ #category : #accessing }
JbWhileLoopStatementNode >> trueStatements: anObject [
	trueStatements := anObject
]
