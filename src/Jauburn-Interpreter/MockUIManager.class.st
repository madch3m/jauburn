Class {
	#name : #MockUIManager,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #accessing }
MockUIManager >> content [


^content
]

{ #category : #accessing }
MockUIManager >> entry: value [


content := value
]
