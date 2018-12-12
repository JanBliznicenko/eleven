Class {
	#name : #ELElement,
	#superclass : #Object,
	#category : 'Eleven-Rendering-Core'
}

{ #category : #rendering }
ELElement class >> renderFor: request on: aStream [
	^ self new renderFor: request on: aStream
]

{ #category : #rendering }
ELElement >> renderFor: request on: aStream [
	self subclassResponsibility
]
