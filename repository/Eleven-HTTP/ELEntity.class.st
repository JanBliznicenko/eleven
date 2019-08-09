Class {
	#name : #ELEntity,
	#superclass : #ELResponseDecorator,
	#instVars : [
		'stream',
		'size'
	],
	#category : #'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELEntity class >> stream: aStream [
	^ self
			stream: aStream
			size: aStream size
]

{ #category : #'instance creation' }
ELEntity class >> stream: aStream size: anInteger [
	^ self new
			stream: aStream;
			size: anInteger
]

{ #category : #'instance creation' }
ELEntity class >> stream: aStream size: anInteger with: decoratedResponse [
	^ (self with: decoratedResponse)
			stream: aStream;
			size: anInteger
]

{ #category : #'instance creation' }
ELEntity class >> stream: aStream with: decoratedResponse [
	^ self
			stream: aStream
			size: aStream size
			with: decoratedResponse
]

{ #category : #accessing }
ELEntity >> entityStreamsDo: aBlock [
	aBlock value: self
]

{ #category : #printing }
ELEntity >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: size asString;
		nextPutAll: ' B';
		nextPut: $)
]

{ #category : #accessing }
ELEntity >> size [
	^ size
]

{ #category : #private }
ELEntity >> size: anInteger [
	size := anInteger
]

{ #category : #private }
ELEntity >> stream: aStream [
	stream := aStream
]
