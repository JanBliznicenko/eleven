Class {
	#name : #ELHandlerVisitor,
	#superclass : #Object,
	#category : 'Eleven-Handlers-Visitors'
}

{ #category : #visiting }
ELHandlerVisitor >> visit: aHandler [
	^ aHandler accept: self
]

{ #category : #visiting }
ELHandlerVisitor >> visitChain: aChain [
	^ self visitRequestHandler: aChain
]

{ #category : #visiting }
ELHandlerVisitor >> visitHandlerDecorator: aHandlerDecorator [
	^ self visitRequestHandler: aHandlerDecorator
]

{ #category : #visiting }
ELHandlerVisitor >> visitParameterPresence: aParameterValue [
	^ self visitHandlerDecorator: aParameterValue
]

{ #category : #visiting }
ELHandlerVisitor >> visitParameterValue: aParameterValue [
	^ self visitHandlerDecorator: aParameterValue
]

{ #category : #visiting }
ELHandlerVisitor >> visitPathSegment: aPathSegment [
	^ self visitHandlerDecorator: aPathSegment
]

{ #category : #visiting }
ELHandlerVisitor >> visitRequestHandler: aRequestHandler [
	"Do nothing - to be overridden by subclasses."
]
