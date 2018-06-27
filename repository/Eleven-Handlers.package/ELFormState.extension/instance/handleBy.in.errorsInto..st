*Eleven-Handlers
handleBy: aHandler in: request errorsInto: multiValueDictionary
	[ ^ aHandler handleForm: self in: request ]
		on: ELValidationFailed
		do: [ :failure |
			multiValueDictionary at: failure key add: failure messageText.
			failure resume ]