printing
writeWithCrlfTo: aStream
	self writeTo: aStream.
	aStream nextPutAll: String crlf