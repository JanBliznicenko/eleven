Class {
	#name : #ELParameterPresence,
	#superclass : #ELHandlerDecorator,
	#instVars : [
		'parameter'
	],
	#category : 'Eleven-Handlers'
}

{ #category : #visiting }
ELParameterPresence >> accept: aVisitor [
	^ aVisitor visitParameterPresence: self
]

{ #category : #'request handling' }
ELParameterPresence >> handle: request [
	request url queryAt: parameter ifPresent: [ :value |
		^ decoratedHandler handle:
				(request withAttributeAt: parameter put: value) ].
	
	^ ELResponse none
]

{ #category : #accessing }
ELParameterPresence >> parameter [
	^ parameter
]

{ #category : #private }
ELParameterPresence >> parameter: aString [
	parameter := aString
]

{ #category : #printing }
ELParameterPresence >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: parameter;
		nextPut: $)
]

{ #category : #accessing }
ELParameterPresence >> value [
	^ '{' , parameter , '}'
]
