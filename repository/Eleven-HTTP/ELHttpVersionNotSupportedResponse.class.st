Class {
	#name : 'ELHttpVersionNotSupportedResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELHttpVersionNotSupportedResponse >> statusCode [
	^ 505
]

{ #category : 'accessing' }
ELHttpVersionNotSupportedResponse >> statusMessage [
	^ 'HTTP Version not supported'
]
