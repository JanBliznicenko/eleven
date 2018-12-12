Class {
	#name : #ELEmptyPath,
	#superclass : #ELHandlerDecorator,
	#category : 'Eleven-Handlers'
}

{ #category : #'request handling' }
ELEmptyPath >> handle: request [
	request hasPathSegments ifTrue: [
		^ ELResponse none ].
	
	^ decoratedHandler handle: request
]
