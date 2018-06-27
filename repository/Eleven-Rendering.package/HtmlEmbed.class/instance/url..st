attributes
url: aStringOrUrl
	^ self
		attributeAt: #src
		put: aStringOrUrl asString