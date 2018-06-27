form handling
handleEmptyForm: request
	^ self pass:
			(request withFormState:
				(self initialStateFrom: request formState for: request))