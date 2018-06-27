rendering
renderStartTagOn: aStream
	aStream
		nextPut: $<;
		nextPutAll: self tagName.
	self renderAttributesOn: aStream.
	aStream nextPut: $>