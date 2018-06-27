matching
match: aString into: aDictionary
	aString ifEmpty: [ ^ false ].
	
	aDictionary at: parameter put: aString.
	
	^ true