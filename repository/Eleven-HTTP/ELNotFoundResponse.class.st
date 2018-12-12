Class {
	#name : #ELNotFoundResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELNotFoundResponse >> statusCode [
	^ 404
]

{ #category : #accessing }
ELNotFoundResponse >> statusMessage [
	^ 'Not Found'
]
