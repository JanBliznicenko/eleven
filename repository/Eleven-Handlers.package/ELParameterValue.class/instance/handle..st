request handling
handle: request
	request url queryAt: parameter ifPresent: [ :paramValue |
		value = paramValue ifTrue: [
			^ decoratedHandler handle:
					(request withAttributeAt: parameter put: value) ] ].
	
	^ ELResponse none