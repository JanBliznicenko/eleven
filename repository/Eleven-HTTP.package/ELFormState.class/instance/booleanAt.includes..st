accessing fields
booleanAt: key includes: valueString
	self
		at: key
		do: [ :each | 
			each asString = valueString
				ifTrue: [ ^ true ] ].
	^ false