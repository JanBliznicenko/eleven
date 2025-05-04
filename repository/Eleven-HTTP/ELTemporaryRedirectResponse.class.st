Class {
	#name : 'ELTemporaryRedirectResponse',
	#superclass : 'ELStatusResponse',
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELTemporaryRedirectResponse >> statusCode [
	^ 307
]

{ #category : 'accessing' }
ELTemporaryRedirectResponse >> statusMessage [
	^ 'Temporary Redirect'
]
