Class {
	#name : 'ELEmptyPath',
	#superclass : 'ELHandlerDecorator',
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'request handling' }
ELEmptyPath >> handle: request [
	request hasPathSegments ifTrue: [
		^ ELResponse none ].
	
	^ decoratedHandler handle: request
]
