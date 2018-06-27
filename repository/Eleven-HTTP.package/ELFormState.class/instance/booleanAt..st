accessing fields
booleanAt: key
	^ fields
		at: key
		ifPresent: [ :value | 
			value isString
				ifTrue: [ value = 'on' or: [ value = '1' ] ]
				ifFalse: [ value isNotNil and: [ value asBoolean ] ] ]
		ifAbsent: [ false ]