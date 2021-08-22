Class {
	#name : #ELManagingMultiThreadedServer,
	#superclass : #ZnManagingMultiThreadedServer,
	#category : #'Eleven-Server-Zinc'
}

{ #category : #accessing }
ELManagingMultiThreadedServer >> sessionManager [
	"Return my session manager"

	^ sessionManager ifNil: [ sessionManager := ELSecureServerSessionManager new ]
]
