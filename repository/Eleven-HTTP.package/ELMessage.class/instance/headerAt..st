accessing
headerAt: aString
	^ self headerAt: aString ifAbsent: [ nil ]