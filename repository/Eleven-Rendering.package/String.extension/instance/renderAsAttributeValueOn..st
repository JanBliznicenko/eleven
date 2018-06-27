*Eleven-Rendering
renderAsAttributeValueOn: aStream
	self do: [ :char |
		char = $&
			ifTrue: [ aStream nextPutAll: '&amp;' ]
			ifFalse: [
				char = $"
					ifTrue: [ aStream nextPutAll: '&quot;' ]
					ifFalse: [ aStream nextPut: char ] ] ]