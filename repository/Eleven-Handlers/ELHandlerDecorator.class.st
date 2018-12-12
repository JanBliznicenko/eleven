Class {
	#name : #ELHandlerDecorator,
	#superclass : #ELRequestHandler,
	#instVars : [
		'decoratedHandler'
	],
	#category : 'Eleven-Handlers'
}

{ #category : #'instance creation' }
ELHandlerDecorator class >> with: aHandler [
	^ self new
			decoratedHandler: aHandler
]

{ #category : #visiting }
ELHandlerDecorator >> accept: aVisitor [
	^ aVisitor visitHandlerDecorator: self
]

{ #category : #accessing }
ELHandlerDecorator >> decoratedHandler [
	^ decoratedHandler
]

{ #category : #private }
ELHandlerDecorator >> decoratedHandler: aHandler [
	decoratedHandler := aHandler
]

{ #category : #'request handling' }
ELHandlerDecorator >> handle: request [
	^ decoratedHandler handle: request
]
