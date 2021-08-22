Class {
	#name : #ELSecureServerSessionManager,
	#superclass : #ZnServerSessionManager,
	#category : #'Eleven-Server-Zinc'
}

{ #category : #accessing }
ELSecureServerSessionManager >> setSession: session in: response [
	"Bind session in response"

	| cookie |
	session ifNil: [ ^ self ].
	(cookie := ZnCookie name: self cookieName value: session id)
		secure: true;
		httponly: true;
		path: '/'.
	response addCookie: cookie
]
