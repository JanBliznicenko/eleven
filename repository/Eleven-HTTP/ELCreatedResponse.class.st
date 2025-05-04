Class {
	#name : 'ELCreatedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELCreatedResponse >> statusCode [
	^ 201
]

{ #category : 'accessing' }
ELCreatedResponse >> statusMessage [
	^ 'Created'
]
