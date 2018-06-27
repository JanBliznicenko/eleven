accessing
entityStreamsDo: aBlock
	super entityStreamsDo: [ :each |
		aBlock value: each.
		^ self ].
	
	"Fall back to just printing the status message if possible."
	(self statusCode = 200
		or: [ self statusCode >= 400 ]) ifTrue: [
			aBlock value: (ELStreamedEntity string: self statusMessage) ]