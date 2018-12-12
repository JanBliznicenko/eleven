Extension { #name : #String }

{ #category : #'*Eleven-Rendering' }
String >> renderAsAttributeValueOn: aStream [
	self do: [ :char |
		char = $&
			ifTrue: [ aStream nextPutAll: '&amp;' ]
			ifFalse: [
				char = $"
					ifTrue: [ aStream nextPutAll: '&quot;' ]
					ifFalse: [ aStream nextPut: char ] ] ]
]

{ #category : #'*Eleven-Rendering' }
String >> renderFor: request on: aStream [
	self do: [ :c | aStream nextPutAll: c asHTMLString ]
]

{ #category : #'*Eleven-Rendering' }
String >> renderUnescapedFor: request on: aStream [
	aStream nextPutAll: self
]
