Class {
	#name : #ELEmptyHtmlTag,
	#superclass : #ELHtmlTag,
	#category : 'Eleven-Rendering-HTML'
}

{ #category : #rendering }
ELEmptyHtmlTag >> renderFor: request on: aStream [
	self renderStartTagOn: aStream
]
