accessing
portNumber
	^ portNumber ifNil: [ self defaultPortNumber ]