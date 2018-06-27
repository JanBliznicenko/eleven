helpers
onOffString: aBooleanOrString
	^ (#(true 'on') includes: aBooleanOrString)
		ifTrue: [ 'on' ]
		ifFalse: [ 'off' ]