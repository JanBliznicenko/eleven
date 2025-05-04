Class {
	#name : 'ELNotAcceptableResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELNotAcceptableResponse >> statusCode [
	^ 406
]

{ #category : 'accessing' }
ELNotAcceptableResponse >> statusMessage [
	^ 'Not Acceptable'
]
