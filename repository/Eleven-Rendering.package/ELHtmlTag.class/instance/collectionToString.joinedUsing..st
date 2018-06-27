helpers
collectionToString: aStringOrCollection joinedUsing: aCharacter
	^ ((aStringOrCollection isCollection
		and: [ aStringOrCollection isString not ])
			ifTrue: [ aStringOrCollection joinUsing: aCharacter ]
			ifFalse: [ aStringOrCollection ])