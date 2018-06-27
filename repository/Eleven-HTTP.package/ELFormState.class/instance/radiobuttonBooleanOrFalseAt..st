accessing fields
radiobuttonBooleanOrFalseAt: key
	^ self radiobuttonBooleanValues at: (self stringAt: key) ifPresent: [ :value | value = true ] ifAbsent: [ false ]