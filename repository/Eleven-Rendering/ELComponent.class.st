Class {
	#name : #ELComponent,
	#superclass : #ELElement,
	#category : 'Eleven-Rendering-Core'
}

{ #category : #converting }
ELComponent >> asResponseFor: request [
	^ (super asResponseFor: request)
			withContentType: self contentType
]

{ #category : #rendering }
ELComponent >> buildFor: request [
	^ self subclassResponsibility
]

{ #category : #callbacks }
ELComponent >> callback: aBlock for: request [
	^ self
			urlForCallback: (ELCallback with: aBlock)
			in: request session
]

{ #category : #constants }
ELComponent >> contentType [
	^ ELContentType htmlWithDefaultCharset
]

{ #category : #callbacks }
ELComponent >> oneShotCallback: aBlock for: request [
	^ self
			urlForCallback: (ELOneShotCallback with: aBlock)
			in: request session
]

{ #category : #rendering }
ELComponent >> renderFor: request on: aStream [
	^ (self buildFor: request)
			renderFor: request on: aStream
]

{ #category : #helpers }
ELComponent >> uniqueIdentifier [
	^ 'component' , self identityHash asString
]

{ #category : #callbacks }
ELComponent >> urlForCallback: aCallback in: aSession [
	^ self urlForCallbackNamed:
			(aCallback registerIn: aSession)
]

{ #category : #callbacks }
ELComponent >> urlForCallbackNamed: key [
	self subclassResponsibility
]
