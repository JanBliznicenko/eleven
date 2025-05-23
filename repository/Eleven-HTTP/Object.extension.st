Extension { #name : 'Object' }

{ #category : '*Eleven-HTTP' }
Object >> asResponseFor: request [
	^ ELOkResponse with:
			(self asStreamedEntityFor: request)
]

{ #category : '*Eleven-HTTP' }
Object >> asStreamedEntityFor: request [
	| entityStream utf8Stream |
	
	entityStream := ReadWriteStream on: (ByteArray new: 4096).
	utf8Stream := ELUtf8Encoder on: entityStream.
	self renderFor: request on: utf8Stream.
	entityStream reset.
	
	^ ELStreamedEntity stream: entityStream
]
