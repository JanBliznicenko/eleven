transforming
withAttributeAt: name put: anObject
	^ self copy
			attributes:
				(attributes copy
					at: name put: anObject;
					yourself)