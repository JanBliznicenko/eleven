Class {
	#name : 'ELGoneResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELGoneResponse >> statusCode [
	^ 410
]

{ #category : 'accessing' }
ELGoneResponse >> statusMessage [
	^ 'Gone'
]
