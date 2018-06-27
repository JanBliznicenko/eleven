accessing fields
at: key index: indexInteger ifAbsent: aBlock
	^ self at: key index: indexInteger ifPresent: [ :value | value ] ifAbsent: aBlock