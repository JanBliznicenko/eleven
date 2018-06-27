rendering
renderAttributesOn: aStream
	aStream
		nextPutAll: ' type="';
		nextPutAll: self type;
		nextPut: $".
	
	super renderAttributesOn: aStream