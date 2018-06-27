helpers
yesNoString: aBooleanOrString
	^ (#(true 'yes') includes: aBooleanOrString)
		ifTrue: [ 'yes' ]
		ifFalse: [ 'no' ]