copying
copyWith: aDictionary
	| newState |
	
	newState := self copy.
	
	aDictionary keysAndValuesDo: [ :key :value |
		newState fields at: key put: value ].
	
	^ newState