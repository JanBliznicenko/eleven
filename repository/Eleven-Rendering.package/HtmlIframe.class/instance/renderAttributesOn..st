rendering
renderAttributesOn: aStream
	securityRules ifNotNil: [
		aStream
			nextPutAll: ' sandbox="';
			nextPutAll: (self collectionToString: securityRules joinedUsing: Character space);
			nextPut: $" ].
	
	super renderAttributesOn: aStream