request handling
handle: request
	request url queryAt: parameter ifPresent: [ :value |
		^ decoratedHandler handle:
				(request withAttributeAt: parameter put: value) ].
	
	^ ELResponse none