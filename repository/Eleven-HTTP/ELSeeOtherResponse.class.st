Class {
	#name : #ELSeeOtherResponse,
	#superclass : #ELStatusResponse,
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELSeeOtherResponse >> statusCode [
	^ 303
]

{ #category : #accessing }
ELSeeOtherResponse >> statusMessage [
	^ 'See Other'
]
