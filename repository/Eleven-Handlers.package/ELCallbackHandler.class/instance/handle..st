request handling
handle: request
	request url queryAt: self callbackParameter ifPresent: [ :value |
		^ self handleCallbackNamed: value forRequest: request ].
	
	^ decoratedHandler handle: request