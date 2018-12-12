Class {
	#name : #ELTemporaryRedirectResponse,
	#superclass : #ELStatusResponse,
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #accessing }
ELTemporaryRedirectResponse >> statusCode [
	^ 307
]

{ #category : #accessing }
ELTemporaryRedirectResponse >> statusMessage [
	^ 'Temporary Redirect'
]
