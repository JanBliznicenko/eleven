Class {
	#name : #ELBadGatewayResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELBadGatewayResponse >> statusCode [
	^ 502
]

{ #category : #accessing }
ELBadGatewayResponse >> statusMessage [
	^ 'Bad Gateway'
]
