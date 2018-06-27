accessing fields
at: key index: indexInteger ifPresent: presentBlock ifAbsent: absentBlock
	fields at: key ifPresent: [ :field |
		(field isArray and: [ field size >= indexInteger ])
			ifTrue: [ ^ presentBlock value: (field at: indexInteger) ]
			ifFalse: [
				indexInteger = 1 ifTrue: [ ^ presentBlock value: field ] ] ].
	
	^ absentBlock value