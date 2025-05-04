Class {
	#name : 'ELMovedPermanentlyResponse',
	#superclass : 'ELStatusResponse',
	#traits : 'ELTRedirectResponse',
	#classTraits : 'ELTRedirectResponse classTrait',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'accessing' }
ELMovedPermanentlyResponse >> statusCode [
	^ 301
]

{ #category : 'accessing' }
ELMovedPermanentlyResponse >> statusMessage [
	^ 'Moved Permanently'
]
