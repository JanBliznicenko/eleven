default server
startDefaultOn: portNumber with: applicationHandler
	^ (self defaultOn: portNumber with: applicationHandler) start