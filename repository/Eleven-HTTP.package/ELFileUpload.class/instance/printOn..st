printing
printOn: aStream
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: filename;
		nextPutAll: ', ';
		nextPutAll: length asString;
		nextPutAll: ' B)'