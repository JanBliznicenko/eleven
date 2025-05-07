Class {
	#name : 'ELValidationFailed',
	#superclass : 'Exception',
	#instVars : [
		'key'
	],
	#category : 'Eleven-Handlers-Forms',
	#package : 'Eleven-Handlers',
	#tag : 'Forms'
}

{ #category : 'signalling' }
ELValidationFailed class >> signal: aMessageText key: aKey [

	^ self new
		  key: aKey;
		  messageText: aMessageText;
		  signal
]

{ #category : 'signalling' }
ELValidationFailed class >> signalKey: aKey [

	^ self new
		  key: aKey;
		  signal
]

{ #category : 'accessing' }
ELValidationFailed >> defaultAction [
	UnhandledError signalForException: self
]

{ #category : 'testing' }
ELValidationFailed >> isResumable [
	^ true
]

{ #category : 'accessing' }
ELValidationFailed >> key [
	^ key
]

{ #category : 'accessing' }
ELValidationFailed >> key: anObject [
	key := anObject
]
