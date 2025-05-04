Class {
	#name : 'ELUtf8Encoder',
	#superclass : 'ELStreamWrapper',
	#instVars : [
		'encoder'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'initialization' }
ELUtf8Encoder >> initialize [
	super initialize.
	
	encoder := ZnUTF8Encoder new
]

{ #category : 'reading' }
ELUtf8Encoder >> next [
	^ encoder nextFromStream: stream
]

{ #category : 'writing' }
ELUtf8Encoder >> nextPut: aCharacter [
	^ encoder nextPut: aCharacter toStream: stream
]
