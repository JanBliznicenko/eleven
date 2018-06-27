accessing fields
integerOrNilAt: key
	^ ((self stringAt: key) reject: [ :each | each isSeparator ]) asInteger