Class {
	#name : #ELDeleteCookie,
	#superclass : #ELCookieResponseDecorator,
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #accessing }
ELDeleteCookie >> headersDo: aBlock [
	super headersDo: aBlock.
	aBlock value: cookie asRemovalResponseHeader
]

{ #category : #printing }
ELDeleteCookie >> printOn: aStream. [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: cookie name;
		nextPut: $)
]
