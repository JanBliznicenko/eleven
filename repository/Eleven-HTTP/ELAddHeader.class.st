Class {
	#name : #ELAddHeader,
	#superclass : #ELHeaderResponseDecorator,
	#instVars : [
		'header'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELAddHeader class >> header: aHeader with: decoratedResponse [
	^ (self with: decoratedResponse)
			header: aHeader
]

{ #category : #'instance creation' }
ELAddHeader class >> headerName: nameString value: valueString with: decoratedResponse [
	^ self
		header: (ELHeader name: nameString value: valueString)
		with: decoratedResponse
]

{ #category : #private }
ELAddHeader >> header: aHeader [
	header := aHeader
]

{ #category : #accessing }
ELAddHeader >> headersDo: aBlock [
	super headersDo: aBlock.
	aBlock value: header
]

{ #category : #printing }
ELAddHeader >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	header writeTo: aStream.
	aStream nextPut: $)
]
