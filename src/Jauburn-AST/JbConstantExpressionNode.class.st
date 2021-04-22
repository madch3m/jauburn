Class {
	#name : #JbConstantExpressionNode,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #'as yet unclassified' }
JbConstantExpressionNode >> evaluateIn: environment [ 

	^value


]

{ #category : #accessing }
JbConstantExpressionNode >> value [
	^ value
]

{ #category : #accessing }
JbConstantExpressionNode >> value: anObject [
	value := anObject
]
