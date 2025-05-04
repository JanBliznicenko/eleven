Class {
	#name : 'ELNotImplementedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELNotImplementedResponse >> statusCode [
	^ 501
]

{ #category : 'accessing' }
ELNotImplementedResponse >> statusMessage [
	^ 'Not Implemented'
]
