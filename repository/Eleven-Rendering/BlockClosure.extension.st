Extension { #name : #BlockClosure }

{ #category : #'*Eleven-Rendering' }
BlockClosure >> renderFor: request on: aStream [
	self value renderFor: request on: aStream
]
