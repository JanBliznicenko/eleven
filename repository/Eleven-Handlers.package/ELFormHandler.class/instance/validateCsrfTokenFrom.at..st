request handling
validateCsrfTokenFrom: request at: key
	^ self handledForms anySatisfy: [ :each |
			request session validateCsrfToken: (request formState stringAt: key) for: each ]