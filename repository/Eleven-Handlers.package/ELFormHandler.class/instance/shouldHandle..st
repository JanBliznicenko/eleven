request handling
shouldHandle: request
	request attributeAt: self requestAttributeName ifPresent: [ :formIdentifier |
		^ self formIdentifier = formIdentifier ].
	
	^ false