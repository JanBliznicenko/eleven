attributes
accessKey: aStringOrCollection
	^ self
		attributeAt: #accesskey
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)