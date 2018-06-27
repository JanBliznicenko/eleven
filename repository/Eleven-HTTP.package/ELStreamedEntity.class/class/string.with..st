instance creation
string: aString with: decoratedResponse
	| utf8Bytes |
	
	utf8Bytes := aString utf8Encoded.
	
	^ self
			stream: utf8Bytes readStream
			size: utf8Bytes size
			with: decoratedResponse