Class {
	#name : 'ELUnauthorizedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELUnauthorizedResponse >> statusCode [
	^ 401
]

{ #category : 'accessing' }
ELUnauthorizedResponse >> statusMessage [
	^ 'Unauthorized'
]
