Class {
	#name : #ELUnauthorizedResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELUnauthorizedResponse >> statusCode [
	^ 401
]

{ #category : #accessing }
ELUnauthorizedResponse >> statusMessage [
	^ 'Unauthorized'
]
