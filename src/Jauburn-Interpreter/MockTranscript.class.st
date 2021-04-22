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

{ #category : #streaming }
MockTranscript >> show: value [


 content := value.
]

{ #category : #accessing }
MockTranscript >> textEntry: value [


content := value.
]
