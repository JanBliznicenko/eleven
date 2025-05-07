Extension { #name : 'ELFormState' }

{ #category : '*Eleven-Handlers' }
ELFormState >> handleBy: aHandler in: request [
	[ ^ self handleBy: aHandler in: request errorsInto: self errors ]
		on: ELFormIsInvalid , ELFormNotHandled
		do: [ :ex |
			^ aHandler pass: request withFormState: self ]
]

{ #category : '*Eleven-Handlers' }
ELFormState >> handleBy: aHandler in: request errorsInto: multiValueDictionary [
	[ ^ aHandler handleForm: self in: request ]
		on: ELValidationFailed
		do: [ :failure |
			multiValueDictionary at: failure key add: failure messageText.
			failure resume ]
]

{ #category : '*Eleven-Handlers' }
ELFormState >> pass [
	ELFormNotHandled signal
]
