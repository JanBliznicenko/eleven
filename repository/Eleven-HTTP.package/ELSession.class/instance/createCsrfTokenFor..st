CSRF tokens
createCsrfTokenFor: anObject
	^ self createCsrfTokenFor: anObject valid: 12 hours