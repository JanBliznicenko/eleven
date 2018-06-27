accessing fields
at: key withIndexDo: aBlock
	fields at: key ifPresent: [ :value |
		value isArray
			ifTrue: [ value withIndexDo: aBlock ]
			ifFalse: [ aBlock value: value value: 1 ] ]