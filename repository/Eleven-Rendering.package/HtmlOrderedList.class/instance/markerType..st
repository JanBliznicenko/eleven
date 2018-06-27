attributes
markerType: aCharacter
	(#($1 $a $A $i $I) includes: aCharacter) ifFalse: [
		self error: 'Invalid type of list marker.' ].
	
	^ self
		attributeAt: #type
		put: aCharacter asString