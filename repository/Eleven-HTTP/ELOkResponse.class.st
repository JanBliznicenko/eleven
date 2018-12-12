Class {
	#name : #ELOkResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELOkResponse >> statusCode [
	^ 200
]

{ #category : #accessing }
ELOkResponse >> statusMessage [
	^ 'OK'
]
