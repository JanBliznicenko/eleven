Class {
	#name : 'ELForbiddenResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELForbiddenResponse >> statusCode [
	^ 403
]

{ #category : 'accessing' }
ELForbiddenResponse >> statusMessage [
	^ 'Forbidden'
]
