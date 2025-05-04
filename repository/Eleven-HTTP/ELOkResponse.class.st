Class {
	#name : 'ELOkResponse',
	#superclass : 'ELStatusResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELOkResponse >> statusCode [
	^ 200
]

{ #category : 'accessing' }
ELOkResponse >> statusMessage [
	^ 'OK'
]
