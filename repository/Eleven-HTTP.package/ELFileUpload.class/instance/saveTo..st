actions
saveTo: aStream
	self stream binary.
	
	[ aStream nextPutAll: (self stream next: 16384) ]
		doWhileFalse: [ self stream atEnd ]