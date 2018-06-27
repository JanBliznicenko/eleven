rendering
renderEventAttributesOn: aStream
	events ifNil: [ ^ self ].
	
	events do: [ :each |
		aStream
			nextPutAll: ' on';
			nextPutAll: each key;
			nextPutAll: '="'.
		self renderAttributeValue: each value on: aStream.
		aStream nextPut: $" ]