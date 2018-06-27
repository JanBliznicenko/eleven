transforming
withAttributes: aDictionary
	^ self copy
			attributes:
				(attributes copy
					addAll: aDictionary;
					yourself)