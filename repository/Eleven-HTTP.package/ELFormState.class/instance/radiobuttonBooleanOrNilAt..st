accessing fields
radiobuttonBooleanOrNilAt: key
	^ self radiobuttonBooleanValues at: (self stringAt: key) ifAbsent: [ nil ]