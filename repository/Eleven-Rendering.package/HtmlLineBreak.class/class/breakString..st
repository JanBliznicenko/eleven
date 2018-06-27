string manipulation
breakString: aString
	aString ifEmpty: [ ^ aString ].
	
	^ (Array streamContents: [ :stream |
			aString linesDo: [ :each |
				stream nextPut: each.
				stream nextPut: self new ] ]) allButLast