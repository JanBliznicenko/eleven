*Eleven-HTTP
printAsHeaderAttributeOn: aStream
	(#(false nil) includes: self value)
		ifTrue: [ ^ self ].
	
	aStream nextPutAll: self key.
	self value ~= true ifTrue: [
		aStream
			nextPut: $=;
			nextPutAll: value asString ]