Class {
	#name : 'ELNoContentResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELNoContentResponse >> statusCode [
	^ 204
]

{ #category : 'accessing' }
ELNoContentResponse >> statusMessage [
	^ 'No Content'
]
