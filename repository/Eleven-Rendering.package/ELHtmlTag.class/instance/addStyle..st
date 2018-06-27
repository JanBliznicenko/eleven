attributes
addStyle: aString
	| colonPosition |
	
	colonPosition := aString indexOf: $: ifAbsent: [ self error: 'Invalid style definition.' ].
	
	^ self
		styleAt: (aString first: colonPosition - 1)
		put: (aString allButFirst: colonPosition)