instance creation
headerName: nameString value: valueString with: decoratedResponse
	^ self
			header: (ELHeader name: nameString value: valueString)
			with: decoratedResponse