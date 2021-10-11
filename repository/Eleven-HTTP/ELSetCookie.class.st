Class {
	#name : #ELSetCookie,
	#superclass : #ELCookieResponseDecorator,
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #accessing }
ELSetCookie >> headersDo: aBlock [
	super headersDo: aBlock.
	aBlock value: cookie asResponseHeader
]

{ #category : #printing }
ELSetCookie >> printOn: aStream [.
	super printOn: aStream.
	
	aStream nextPut: $(.
	cookie writeTo: aStream.
	aStream nextPut: $)
]
