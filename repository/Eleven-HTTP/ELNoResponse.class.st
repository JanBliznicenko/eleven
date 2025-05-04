Class {
	#name : 'ELNoResponse',
	#superclass : 'ELResponse',
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'accessing' }
ELNoResponse >> entityStreamsDo: aBlock [
	"Do nothing, self contains no entity."
]

{ #category : 'accessing' }
ELNoResponse >> headersDo: aBlock [
	"Do nothing, self contains no headers."
]

{ #category : 'request handling' }
ELNoResponse >> responsesFor: request do: aBlock [
	"Do nothing, self is not a valid response."
]

{ #category : 'accessing' }
ELNoResponse >> statusCode [
	self error: 'An empty response cannot return a status code.'
]

{ #category : 'accessing' }
ELNoResponse >> statusMessage [
	self error: 'An empty response cannot return a status message.'
]
