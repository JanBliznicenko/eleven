Class {
	#name : 'ELStreamedEntity',
	#superclass : 'ELEntity',
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'instance creation' }
ELStreamedEntity class >> string: aString [
	| utf8Bytes |
	
	utf8Bytes := aString utf8Encoded.
	
	^ self
			stream: utf8Bytes readStream
			size: utf8Bytes size
]

{ #category : 'instance creation' }
ELStreamedEntity class >> string: aString with: decoratedResponse [
	| utf8Bytes |
	
	utf8Bytes := aString utf8Encoded.
	
	^ self
			stream: utf8Bytes readStream
			size: utf8Bytes size
			with: decoratedResponse
]
