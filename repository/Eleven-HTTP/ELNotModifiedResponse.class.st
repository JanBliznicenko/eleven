Class {
	#name : 'ELNotModifiedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELNotModifiedResponse >> statusCode [
	^ 304
]

{ #category : 'accessing' }
ELNotModifiedResponse >> statusMessage [
	^ 'Not Modified'
]
