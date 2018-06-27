validating
validate: fieldName sameAs: otherFieldName message: aString
	(self stringAt: fieldName) = (self stringAt: otherFieldName) ifFalse: [
		self validationError: aString for: fieldName ]