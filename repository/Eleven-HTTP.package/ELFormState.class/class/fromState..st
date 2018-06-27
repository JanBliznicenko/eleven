instance creation
fromState: aFormState
	^ self new
			fields: aFormState fields copy;
			errors: aFormState errors copy