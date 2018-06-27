rendering
renderStyleAttributeOn: aStream
	styles ifNil: [ ^ self ].
	
	aStream
		nextPutAll: ' style="';
		nextPutAll: self buildStyleAttribute;
		nextPut: $"