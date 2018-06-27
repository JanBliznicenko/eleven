default server
defaultOn: portNumber with: applicationHandler
	self stopDefault.
	^ Default := self on: portNumber with: applicationHandler