request handling
handleCallbackNamed: callbackName forRequest: request
	| callback |
	
	callback := request session callbackAt: callbackName ifAbsent: [ ^ decoratedHandler handle: request ].
	
	^ callback valueForRequest: request withKey: callbackName