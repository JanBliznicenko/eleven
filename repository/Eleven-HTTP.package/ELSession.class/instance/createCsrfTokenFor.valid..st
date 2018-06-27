CSRF tokens
createCsrfTokenFor: anObject valid: aDuration
	"This method is not atomic, theoretically two same tokens might be generated at the same time but the probability is very low."

	| token |
	[ token := UUID new asBase64String
		, anObject identityHash asBase64String ]
		doWhileTrue: [ csrfTokens includesKey: token ].
	csrfTokens at: token put: DateAndTime now + aDuration.
	^ token