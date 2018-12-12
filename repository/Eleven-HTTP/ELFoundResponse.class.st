Class {
	#name : #ELFoundResponse,
	#superclass : #ELStatusResponse,
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELFoundResponse >> statusCode [
	^ 302
]

{ #category : #accessing }
ELFoundResponse >> statusMessage [
	^ 'Found'
]
