validating
validateChecked: fieldName message: aString
	(self booleanAt: fieldName) ifFalse: [
		self validationError: aString for: fieldName ]