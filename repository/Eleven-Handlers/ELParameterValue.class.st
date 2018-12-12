Class {
	#name : #ELParameterValue,
	#superclass : #ELHandlerDecorator,
	#instVars : [
		'parameter',
		'value'
	],
	#category : 'Eleven-Handlers'
}

{ #category : #visiting }
ELParameterValue >> accept: aVisitor [
	^ aVisitor visitParameterValue: self
]

{ #category : #'request handling' }
ELParameterValue >> handle: request [
	request url queryAt: parameter ifPresent: [ :paramValue |
		value = paramValue ifTrue: [
			^ decoratedHandler handle:
					(request withAttributeAt: parameter put: value) ] ].
	
	^ ELResponse none
]

{ #category : #accessing }
ELParameterValue >> parameter [
	^ parameter
]

{ #category : #private }
ELParameterValue >> parameter: aString [
	parameter := aString
]

{ #category : #printing }
ELParameterValue >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: parameter;
		nextPutAll: ' = ';
		print: value;
		nextPut: $)
]

{ #category : #accessing }
ELParameterValue >> value [
	^ value
]

{ #category : #private }
ELParameterValue >> value: aString [
	value := aString
]
