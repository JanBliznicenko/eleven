Class {
	#name : 'ELApplication',
	#superclass : 'ELRequestHandler',
	#instVars : [
		'handler',
		'newSessionBlock'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'constants' }
ELApplication class >> defaultServerClass [
	^ ELZincServer
]

{ #category : 'building' }
ELApplication >> buildHandler [
	self subclassResponsibility
]

{ #category : 'constants' }
ELApplication >> defaultServerClass [
	^ self class defaultServerClass
]

{ #category : 'constants' }
ELApplication >> defaultSessionClass [
	^ ELSession
]

{ #category : 'request handling' }
ELApplication >> handle: request [
	^ (self handler handle:
			(self transformRequest: request))
				asResponseFor: request
]

{ #category : 'request handling' }
ELApplication >> handleException: anException inRequest: request [
	^ anException pass
]

{ #category : 'accessing' }
ELApplication >> handler [
	^ handler ifNil: [
			handler := self buildHandler ]
]

{ #category : 'initialization' }
ELApplication >> initialize [
	super initialize.
	
	self sessionClass: self defaultSessionClass
]

{ #category : 'accessing' }
ELApplication >> newSession [
	^ newSessionBlock value
]

{ #category : 'accessing' }
ELApplication >> newSessionBlock: aBlock [
	newSessionBlock := aBlock
]

{ #category : 'accessing' }
ELApplication >> sessionClass: aClass [
	self newSessionBlock: [ aClass new ]
]

{ #category : 'request handling' }
ELApplication >> transformRequest: request [
	^ request withApplication: self
]
