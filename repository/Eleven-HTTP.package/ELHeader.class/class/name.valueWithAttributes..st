instance creation
name: nameString valueWithAttributes: valueString
	| parts |
	
	parts := valueString substrings: #($;).
	
	^ self
			name: nameString
			value: parts first
			attributes:
				(parts allButFirst collect: [ :each |
					self attributeAssociationFrom: each ])
						asDictionary