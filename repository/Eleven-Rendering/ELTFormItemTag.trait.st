Trait {
	#name : #ELTFormItemTag,
	#category : #'Eleven-Rendering-HTML-Tags'
}

{ #category : #accessing }
ELTFormItemTag >> form: aString [
	self attributeAt: #form put: aString
]
