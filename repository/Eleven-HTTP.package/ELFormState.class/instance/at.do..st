accessing fields
at: key do: aBlock
	fields at: key ifPresent: [ :value |
		value isArray
			ifTrue: [ value do: aBlock ]
			ifFalse: [ aBlock value: value ] ]