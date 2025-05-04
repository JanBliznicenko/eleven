Class {
	#name : 'ELServiceUnavailableResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELServiceUnavailableResponse >> statusCode [
	^ 503
]

{ #category : 'accessing' }
ELServiceUnavailableResponse >> statusMessage [
	^ 'Service Unavailable'
]
