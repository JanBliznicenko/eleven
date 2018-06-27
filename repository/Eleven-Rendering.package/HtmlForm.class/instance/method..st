attributes
method: aString
	(#(GET POST get post nil) includes: aString) ifFalse: [
		self error: 'Unknown HTTP method for form submission.' ].
	
	^ self
		attributeAt: #method
		put: (aString ifNotNil: [ aString asLowercase ])