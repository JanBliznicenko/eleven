rendering
renderClassAttributeOn: aStream
	classNames ifNil: [ ^ self ].
	
	aStream
		nextPutAll: ' class="';
		nextPutAll: (classNames joinUsing: Character space);
		nextPut: $"