Extension { #name : #SequenceableCollection }

{ #category : #'*Eleven-Rendering' }
SequenceableCollection >> renderFor: request on: aStream [
	self do: [ :each |
		each renderFor: request on: aStream ]
]
