Class {
	#name : #ELStreamedEntity,
	#superclass : #ELResponseDecorator,
	#instVars : [
		'stream',
		'size'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELStreamedEntity class >> stream: aStream [
	^ self
			stream: aStream
			size: aStream size
]

{ #category : #'instance creation' }
ELStreamedEntity class >> stream: aStream size: anInteger [
	^ self new
			stream: aStream;
			size: anInteger
]

{ #category : #'instance creation' }
ELStreamedEntity class >> stream: aStream size: anInteger with: decoratedResponse [
	^ (self with: decoratedResponse)
			stream: aStream;
			size: anInteger
]

{ #category : #'instance creation' }
ELStreamedEntity class >> stream: aStream with: decoratedResponse [
	^ self
			stream: aStream
			size: aStream size
			with: decoratedResponse
]

{ #category : #'instance creation' }
ELStreamedEntity class >> string: aString [
	| utf8Bytes |
	
	utf8Bytes := aString utf8Encoded.
	
	^ self
			stream: utf8Bytes readStream
			size: utf8Bytes size
]

{ #category : #'instance creation' }
ELStreamedEntity class >> string: aString with: decoratedResponse [
	| utf8Bytes |
	
	utf8Bytes := aString utf8Encoded.
	
	^ self
			stream: utf8Bytes readStream
			size: utf8Bytes size
			with: decoratedResponse
]

{ #category : #accessing }
ELStreamedEntity >> entityStreamsDo: aBlock [
	aBlock value: self
]

{ #category : #printing }
ELStreamedEntity >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: size asString;
		nextPutAll: ' B';
		nextPut: $)
]

{ #category : #accessing }
ELStreamedEntity >> size [
	^ size
]

{ #category : #private }
ELStreamedEntity >> size: anInteger [
	size := anInteger
]

{ #category : #private }
ELStreamedEntity >> stream: aStream [
	stream := aStream
]
