attributes
translate: aBooleanOrString
	^ self
		attributeAt: #translate
		put: (self yesNoString: aBooleanOrString)