accessing fields
stringAt: key
	| value |
	value := (self at: key ifAbsent: [ '' ]) ifNil: [ '' ].
	^ ((value = true or: [ value = false ])
		ifTrue: [ value asBit ]
		ifFalse: [ value ]) asString trimmed