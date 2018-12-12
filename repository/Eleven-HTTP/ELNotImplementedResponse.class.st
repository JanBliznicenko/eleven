Class {
	#name : #ELNotImplementedResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELNotImplementedResponse >> statusCode [
	^ 501
]

{ #category : #accessing }
ELNotImplementedResponse >> statusMessage [
	^ 'Not Implemented'
]
