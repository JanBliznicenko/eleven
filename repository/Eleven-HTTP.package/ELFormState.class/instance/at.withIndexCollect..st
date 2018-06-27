accessing fields
at: key withIndexCollect: aBlock
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value withIndexCollect: aBlock ]
					ifFalse: [ Array with: (aBlock value: value value: 1) ] ]
			ifAbsent: [ #() ]