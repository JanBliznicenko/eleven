request handling
handle: request
	request hasPathSegments ifTrue: [
		^ ELResponse none ].
	
	^ decoratedHandler handle: request