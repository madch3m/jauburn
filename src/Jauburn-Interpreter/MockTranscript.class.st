Class {
	#name : #MockTranscript,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
MockTranscript >> content [ 

^content
]

{ #category : #initialization }
MockTranscript >> initialize [

^Transcript.
]

{ #category : #accessing }
MockTranscript >> textEntry: value [


content := value.
]
