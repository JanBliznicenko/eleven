attributes
wrap: aString
	(#(soft hard nil) includes: aString) ifFalse: [
		self error: 'Invalid textArea wrap type.' ].
	
	^ self
		attributeAt: #wrap
		put: aString