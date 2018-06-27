accessing fields
radiobuttonBooleanOrFalseAt: key index: indexInteger
	^ self radiobuttonBooleanValues at: (self stringAt: key index: indexInteger) ifPresent: [ :value | value = true ] ifAbsent: [ false ]