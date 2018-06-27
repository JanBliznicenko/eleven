accessing fields
radiobuttonBooleanOrNilAt: key index: indexInteger
	^ self radiobuttonBooleanValues at: (self stringAt: key index: indexInteger) ifAbsent: [ nil ]