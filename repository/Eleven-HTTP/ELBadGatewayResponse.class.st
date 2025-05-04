Class {
	#name : 'ELBadGatewayResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELBadGatewayResponse >> statusCode [
	^ 502
]

{ #category : 'accessing' }
ELBadGatewayResponse >> statusMessage [
	^ 'Bad Gateway'
]
