accessing fields
at: key collect: aBlock
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value collect: aBlock ]
					ifFalse: [ Array with: (aBlock value: value) ] ]
			ifAbsent: [ #() ]