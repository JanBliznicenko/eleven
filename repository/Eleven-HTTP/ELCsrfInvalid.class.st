Class {
	#name : 'ELCsrfInvalid',
	#superclass : 'Exception',
	#instVars : [
		'string',
		'object',
		'reason'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'signalling' }
ELCsrfInvalid class >> signalReason: aReason string: aString object: anObject [

	^ self new
		  string: aString;
		  object: anObject;
		  reason: aReason;
		  signal
]

{ #category : 'accessing' }
ELCsrfInvalid >> messageText [

	^ super messageText ifEmpty: [
		  reason asString , ' ; string: ' , string asString , ' ; object: '
		  , object asString ]
]

{ #category : 'accessing' }
ELCsrfInvalid >> object: anObject [ 
	object := anObject
]

{ #category : 'accessing' }
ELCsrfInvalid >> reason: aString [ 
	reason := aString
]

{ #category : 'accessing' }
ELCsrfInvalid >> string: aString [ 
	string := aString
]
