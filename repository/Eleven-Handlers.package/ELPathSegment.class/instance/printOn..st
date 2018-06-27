printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: segment;
		nextPut: $)