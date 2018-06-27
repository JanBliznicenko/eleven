attributes
addClass: aString
	aString ifEmpty: [ ^ self ].
	(self classNames includes: aString)
		ifTrue: [ ^ self ].
	self classNames add: aString