Class {
	#name : #ELNotModifiedResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELNotModifiedResponse >> statusCode [
	^ 304
]

{ #category : #accessing }
ELNotModifiedResponse >> statusMessage [
	^ 'Not Modified'
]
