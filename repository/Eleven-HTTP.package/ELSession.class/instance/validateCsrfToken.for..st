CSRF tokens
validateCsrfToken: aString for: anObject
	| validity |
	(aString endsWith: anObject identityHash asBase64String)
		ifFalse: [ ^ false ].
	validity := csrfTokens at: aString ifAbsent: [ ^ false ].
	validity >= DateAndTime now
		ifFalse: [ csrfTokens removeKey: aString.
			^ false ].
	^ true