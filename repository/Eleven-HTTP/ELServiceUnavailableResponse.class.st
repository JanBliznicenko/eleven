Class {
	#name : #ELServiceUnavailableResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELServiceUnavailableResponse >> statusCode [
	^ 503
]

{ #category : #accessing }
ELServiceUnavailableResponse >> statusMessage [
	^ 'Service Unavailable'
]
