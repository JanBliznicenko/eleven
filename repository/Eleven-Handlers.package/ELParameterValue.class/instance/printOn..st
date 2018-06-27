printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: parameter;
		nextPutAll: ' = ';
		print: value;
		nextPut: $)