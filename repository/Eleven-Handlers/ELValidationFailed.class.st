Class {
	#name : #ELValidationFailed,
	#superclass : #Exception,
	#instVars : [
		'key'
	],
	#category : 'Eleven-Handlers-Forms'
}

{ #category : #accessing }
ELValidationFailed >> defaultAction [
	UnhandledError signalForException: self
]

{ #category : #testing }
ELValidationFailed >> isResumable [
	^ true
]

{ #category : #accessing }
ELValidationFailed >> key [
	^ key
]

{ #category : #accessing }
ELValidationFailed >> key: anObject [
	key := anObject
]
