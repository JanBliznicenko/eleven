request handling
handleException: anException inRequest: aZnRequest
	^ [ applicationHandler
		handleException: anException
		inRequest: (ELRequest fromZnRequest: aZnRequest) ]
		on: Exception
		do: [ :ex | 
			self isDebugMode
				ifTrue: [ ex debug ]
				ifFalse: [ Smalltalk logError: ex messageText inContext: ex signalerContext ].
			^ self
				internalServerErrorResponse: (ELStreamedEntity string: self technicalErrorText , ' ' , ex messageText) ]