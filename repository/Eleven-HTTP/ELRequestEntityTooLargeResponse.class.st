Class {
	#name : 'ELRequestEntityTooLargeResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELRequestEntityTooLargeResponse >> statusCode [
	^ 413
]

{ #category : 'accessing' }
ELRequestEntityTooLargeResponse >> statusMessage [
	^ 'Request Entity Too Large'
]
