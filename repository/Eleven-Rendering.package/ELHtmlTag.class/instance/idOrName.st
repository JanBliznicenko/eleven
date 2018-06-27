attributes
idOrName
	^ self id ifNil: [
		self attributeAt: #name ]