accessing fields
booleanAt: key index: indexInteger
	^ self at: key index: indexInteger ifPresent: [ :value | value ~~ false ] ifAbsent: [ false ]