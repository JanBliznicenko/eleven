Class {
	#name : 'ELSeeOtherResponse',
	#superclass : 'ELStatusResponse',
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELSeeOtherResponse >> statusCode [
	^ 303
]

{ #category : 'accessing' }
ELSeeOtherResponse >> statusMessage [
	^ 'See Other'
]
