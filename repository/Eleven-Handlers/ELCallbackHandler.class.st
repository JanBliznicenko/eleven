Class {
	#name : 'ELCallbackHandler',
	#superclass : 'ELHandlerDecorator',
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'constants' }
ELCallbackHandler >> callbackParameter [
	^ ELCallback parameterName
]

{ #category : 'request handling' }
ELCallbackHandler >> handle: request [
	request url queryAt: self callbackParameter ifPresent: [ :value |
		^ self handleCallbackNamed: value forRequest: request ].
	
	^ decoratedHandler handle: request
]

{ #category : 'request handling' }
ELCallbackHandler >> handleCallbackNamed: callbackName forRequest: request [
	| callback |
	
	callback := request session callbackAt: callbackName ifAbsent: [ ^ decoratedHandler handle: request ].
	
	^ callback valueForRequest: request withKey: callbackName
]
