request handling
handleRequest: aZnRequest
	[ ^ (applicationHandler handle: (ELRequest fromZnRequest: aZnRequest)) asZnResponse ]
		on: Exception
		do: [ :ex | ^ (self handleException: ex inRequest: aZnRequest) asZnResponse ]