Class {
	#name : #ELRemoveHeader,
	#superclass : #ELHeaderResponseDecorator,
	#instVars : [
		'headerName',
		'headerNameLowercase'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELRemoveHeader class >> name: aString with: decoratedResponse [
	^ (self with: decoratedResponse)
			headerName: aString
]

{ #category : #private }
ELRemoveHeader >> headerName: aString [
	headerName := aString.
	headerNameLowercase := aString asLowercase
]

{ #category : #accessing }
ELRemoveHeader >> headersDo: aBlock [
	decoratedResponse headersDo: [ :each |
		each name asLowercase ~= headerNameLowercase
			ifTrue: [ aBlock value: each ] ]
]

{ #category : #printing }
ELRemoveHeader >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: headerName;
		nextPut: $)
]
