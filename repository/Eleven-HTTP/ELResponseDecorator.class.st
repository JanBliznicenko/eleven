Class {
	#name : 'ELResponseDecorator',
	#superclass : 'ELResponse',
	#instVars : [
		'decoratedResponse'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'instance creation' }
ELResponseDecorator class >> new [
	^ self with: ELResponse empty
]

{ #category : 'instance creation' }
ELResponseDecorator class >> with: decoratedResponse [
	^ self basicNew
			initialize;
			decoratedResponse: decoratedResponse
]

{ #category : 'private' }
ELResponseDecorator >> decoratedResponse: aResponse [
	decoratedResponse := aResponse
]

{ #category : 'accessing' }
ELResponseDecorator >> entityStreamsDo: aBlock [
	decoratedResponse entityStreamsDo: aBlock
]

{ #category : 'accessing' }
ELResponseDecorator >> headersDo: aBlock [
	decoratedResponse headersDo: aBlock
]

{ #category : 'accessing' }
ELResponseDecorator >> statusCode [
	^ decoratedResponse statusCode
]

{ #category : 'accessing' }
ELResponseDecorator >> statusMessage [
	^ decoratedResponse statusMessage
]
