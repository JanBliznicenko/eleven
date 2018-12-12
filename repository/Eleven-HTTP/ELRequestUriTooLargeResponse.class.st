Class {
	#name : #ELRequestUriTooLargeResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELRequestUriTooLargeResponse >> statusCode [
	^ 414
]

{ #category : #accessing }
ELRequestUriTooLargeResponse >> statusMessage [
	^ 'Request-URI Too Large'
]
