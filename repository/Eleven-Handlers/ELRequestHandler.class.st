Class {
	#name : #ELRequestHandler,
	#superclass : #Object,
	#category : 'Eleven-Handlers'
}

{ #category : #visiting }
ELRequestHandler >> accept: aVisitor [
	^ aVisitor visitRequestHandler: self
]

{ #category : #'request handling' }
ELRequestHandler >> handle: request [
	self subclassResponsibility
]
