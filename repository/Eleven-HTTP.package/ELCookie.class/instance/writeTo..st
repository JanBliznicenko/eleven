printing
writeTo: aStream
	aStream
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: value