form handling
handleEmptyForm: request
	"The handler decided not to handle this request but the request came with POST data. Something might have been wrong with the validation (e.g. an expired CSRF token) so we just pass the request, possibly saving the entered data."
	request method = ELMethod post ifTrue: [
		^ self pass: request ].
	
	^ super handleEmptyForm: request