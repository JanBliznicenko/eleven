rendering
renderEndTagOn: aStream
	aStream
		nextPut: $<;
		nextPut: $/;
		nextPutAll: self tagName;
		nextPut: $>