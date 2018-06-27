printing
printOn: aStream.
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: cookie name;
		nextPut: $)