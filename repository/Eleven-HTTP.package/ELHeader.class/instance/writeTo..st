printing
writeTo: aStream
	aStream
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: value.
	
	self writeAttributesTo: aStream