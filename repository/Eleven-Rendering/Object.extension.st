Extension { #name : #Object }

{ #category : #'*Eleven-Rendering' }
Object >> buildFor: request [
	^ self
]

{ #category : #'*Eleven-Rendering' }
Object >> isHtmlTag [
	^ false
]

{ #category : #'*Eleven-Rendering' }
Object >> renderAsAttributeValueOn: aStream [
	self printString renderAsAttributeValueOn: aStream
]

{ #category : #'*Eleven-Rendering' }
Object >> renderFor: request on: aStream [
	self printString renderFor: request on: aStream
]

{ #category : #'*Eleven-Rendering' }
Object >> renderUnescapedFor: request on: aStream [
	self printString renderUnescapedFor: request on: aStream
]
