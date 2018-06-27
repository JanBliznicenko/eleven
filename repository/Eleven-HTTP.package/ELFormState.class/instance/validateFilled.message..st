validating
validateFilled: fieldName message: aString
	(self stringAt: fieldName) ifEmpty: [
		self validationError: aString for: fieldName ]