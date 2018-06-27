instance creation
stream: aStream with: decoratedResponse
	^ self
			stream: aStream
			size: aStream size
			with: decoratedResponse