Class {
	#name : #ELNotAcceptableResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELNotAcceptableResponse >> statusCode [
	^ 406
]

{ #category : #accessing }
ELNotAcceptableResponse >> statusMessage [
	^ 'Not Acceptable'
]
