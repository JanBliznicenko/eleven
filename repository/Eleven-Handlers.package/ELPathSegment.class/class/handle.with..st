instance creation
handle: aString with: decoratedHandler
	(aString includes: $/) ifTrue: [
		^ ELPathPattern handle: aString with: decoratedHandler ].
	
	^ (self with: decoratedHandler)
			segment: aString