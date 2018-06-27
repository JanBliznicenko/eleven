printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: pattern;
		nextPut: $)