Class {
	#name : 'ELMethodNotAllowedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELMethodNotAllowedResponse >> statusCode [
	^ 405
]

{ #category : 'accessing' }
ELMethodNotAllowedResponse >> statusMessage [
	^ 'Method Not Allowed'
]
