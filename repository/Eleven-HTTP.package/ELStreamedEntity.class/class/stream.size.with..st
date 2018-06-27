instance creation
stream: aStream size: anInteger with: decoratedResponse
	^ (self with: decoratedResponse)
			stream: aStream;
			size: anInteger