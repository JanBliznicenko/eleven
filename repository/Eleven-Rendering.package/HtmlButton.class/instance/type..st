attributes
type: aString
	(#(button submit reset menu) includes: aString)
		ifFalse: [ self error: 'Invalid button type.' ].
	^ self attributeAt: #type put: aString