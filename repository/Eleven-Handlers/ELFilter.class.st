Class {
	#name : #ELFilter,
	#superclass : #ELHandlerDecorator,
	#category : 'Eleven-Handlers'
}

{ #category : #'request handling' }
ELFilter >> handle: request [
	^ (self shouldPass: request)
			ifTrue: [ decoratedHandler handle: request ]
			ifFalse: [ self handlePassed: request ]
]

{ #category : #'request handling' }
ELFilter >> handlePassed: request [
	"By default, do not handle the request."
	^ ELResponse none
]

{ #category : #'request handling' }
ELFilter >> shouldPass: request [
	self subclassResponsibility
]
