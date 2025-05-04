Class {
	#name : 'ELRequestUriTooLargeResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELRequestUriTooLargeResponse >> statusCode [
	^ 414
]

{ #category : 'accessing' }
ELRequestUriTooLargeResponse >> statusMessage [
	^ 'Request-URI Too Large'
]
