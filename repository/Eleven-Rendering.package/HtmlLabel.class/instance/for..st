attributes
for: aStringOrTag
	aStringOrTag isHtmlTag ifTrue: [
		^ self for: aStringOrTag id ].
	
	^ self
		attributeAt: #for
		put: aStringOrTag