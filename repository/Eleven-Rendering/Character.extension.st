Extension { #name : #Character }

{ #category : #'*Eleven-Rendering' }
Character >> renderAsAttributeValueOn: aStream [
	self asString renderAsAttributeValueOn: aStream
]

{ #category : #'*Eleven-Rendering' }
Character >> renderFor: request on: aStream [
	aStream nextPutAll: self asHTMLString
]
