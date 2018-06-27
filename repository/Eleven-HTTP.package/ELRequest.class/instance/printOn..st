printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: method name;
		space;
		print: url;
		space;
		nextPutAll: version;
		nextPut: $)