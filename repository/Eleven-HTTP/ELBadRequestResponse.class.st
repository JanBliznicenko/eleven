Class {
	#name : 'ELBadRequestResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELBadRequestResponse >> statusCode [
	^ 400
]

{ #category : 'accessing' }
ELBadRequestResponse >> statusMessage [
	^ 'Bad Request'
]
