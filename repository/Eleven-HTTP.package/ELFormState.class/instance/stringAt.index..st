accessing fields
stringAt: key index: indexInteger
	^ ((self at: key index: indexInteger ifAbsent: [ '' ]) ifNil: [ '' ]) asString trimmed