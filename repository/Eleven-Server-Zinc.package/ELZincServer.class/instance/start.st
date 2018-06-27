actions
start
	zincServer ifNil: [
		zincServer := self defaultServerClass on: self portNumber.
		zincServer delegate: self ].
	
	zincServer start