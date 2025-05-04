Class {
	#name : 'ELNotFoundResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELNotFoundResponse >> statusCode [
	^ 404
]

{ #category : 'accessing' }
ELNotFoundResponse >> statusMessage [
	^ 'Not Found'
]
