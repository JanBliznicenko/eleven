accessing fields
integerAt: key default: anInteger
	^ (self integerOrNilAt: key) ifNil: [ anInteger ]