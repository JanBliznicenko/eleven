attributes
value: aString
	^ self
		attributeAt: #value
		put: (aString ifNotNil: [ aString asString ])