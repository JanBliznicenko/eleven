attributes
dropZone: aStringOrCollection
	^ self
		attributeAt: #dropzone
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)