Class {
	#name : 'ELInternalServerErrorResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELInternalServerErrorResponse >> statusCode [
	^ 500
]

{ #category : 'accessing' }
ELInternalServerErrorResponse >> statusMessage [
	^ 'Internal Server Error'
]
