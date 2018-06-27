accessing fields
integerAt: key index: indexInteger default: anInteger
	^ (self integerOrNilAt: key index: indexInteger) ifNil: [ anInteger ]