request handling
shouldHandle: request
	^ (super shouldHandle: request)
		and: [ request method = ELMethod post ]