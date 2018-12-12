Class {
	#name : #ELMethodNotAllowedResponse,
	#superclass : #ELStatusResponse,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELMethodNotAllowedResponse >> statusCode [
	^ 405
]

{ #category : #accessing }
ELMethodNotAllowedResponse >> statusMessage [
	^ 'Method Not Allowed'
]
