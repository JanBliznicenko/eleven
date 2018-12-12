Class {
	#name : #ELGoneResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELGoneResponse >> statusCode [
	^ 410
]

{ #category : #accessing }
ELGoneResponse >> statusMessage [
	^ 'Gone'
]
