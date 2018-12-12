Class {
	#name : #ELCreatedResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELCreatedResponse >> statusCode [
	^ 201
]

{ #category : #accessing }
ELCreatedResponse >> statusMessage [
	^ 'Created'
]
