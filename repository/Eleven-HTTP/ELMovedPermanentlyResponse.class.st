Class {
	#name : #ELMovedPermanentlyResponse,
	#superclass : #ELStatusResponse,
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELMovedPermanentlyResponse >> statusCode [
	^ 301
]

{ #category : #accessing }
ELMovedPermanentlyResponse >> statusMessage [
	^ 'Moved Permanently'
]
