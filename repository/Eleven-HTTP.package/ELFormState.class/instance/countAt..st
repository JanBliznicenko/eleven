accessing fields
countAt: key
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value size ]
					ifFalse: [ 1 ] ]
			ifAbsent: [ 0 ]