printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: size asString;
		nextPutAll: ' B';
		nextPut: $)