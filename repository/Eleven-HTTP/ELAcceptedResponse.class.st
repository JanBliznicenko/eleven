Class {
	#name : 'ELAcceptedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELAcceptedResponse >> statusCode [
	^ 202
]

{ #category : 'accessing' }
ELAcceptedResponse >> statusMessage [
	^ 'Accepted'
]
