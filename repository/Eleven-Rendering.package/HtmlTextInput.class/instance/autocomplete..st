attributes
autocomplete: aBooleanOrString
	^ self
		attributeAt: #autocomplete
		put: (self onOffString: aBooleanOrString)