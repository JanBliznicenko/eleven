request handling
handle: request
	^ (self shouldPass: request)
			ifTrue: [ decoratedHandler handle: request ]
			ifFalse: [ self handlePassed: request ]