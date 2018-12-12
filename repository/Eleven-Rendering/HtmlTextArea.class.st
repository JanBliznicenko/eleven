Class {
	#name : #HtmlTextArea,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlTextArea >> autocomplete: aBooleanOrString [
	^ self
		attributeAt: #autocomplete
		put: (self onOffString: aBooleanOrString)
]

{ #category : #attributes }
HtmlTextArea >> autofocus: aBoolean [
	^ self
		attributeAt: #autofocus
		put: aBoolean
]

{ #category : #attributes }
HtmlTextArea >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlTextArea >> beFocused [
	^ self autofocus: true
]

{ #category : #attributes }
HtmlTextArea >> beReadOnly [
	^ self readOnly: true
]

{ #category : #attributes }
HtmlTextArea >> beRequired [
	^ self required: true
]

{ #category : #attributes }
HtmlTextArea >> columns: anInteger [
	^ self
		attributeAt: #cols
		put: anInteger
]

{ #category : #attributes }
HtmlTextArea >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlTextArea >> dontAutocomplete [
	^ self autocomplete: false
]

{ #category : #attributes }
HtmlTextArea >> maxLength: anInteger [
	^ self
		attributeAt: #maxlength
		put: anInteger
]

{ #category : #attributes }
HtmlTextArea >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #attributes }
HtmlTextArea >> placeholder: aString [
	^ self
		attributeAt: #placeholder
		put: aString
]

{ #category : #attributes }
HtmlTextArea >> readOnly: aBoolean [
	^ self
		attributeAt: #readonly
		put: aBoolean
]

{ #category : #attributes }
HtmlTextArea >> required: aBoolean [
	^ self
		attributeAt: #required
		put: aBoolean
]

{ #category : #attributes }
HtmlTextArea >> rows: anInteger [
	^ self
		attributeAt: #rows
		put: anInteger
]

{ #category : #accessing }
HtmlTextArea >> tagName [
	^ #textarea
]

{ #category : #attributes }
HtmlTextArea >> value: aString [
	^ self with: aString asString
]

{ #category : #attributes }
HtmlTextArea >> wrap: aString [
	(#(soft hard nil) includes: aString) ifFalse: [
		self error: 'Invalid textArea wrap type.' ].
	
	^ self
		attributeAt: #wrap
		put: aString
]

{ #category : #attributes }
HtmlTextArea >> wrapHard [
	^ self wrap: #hard
]

{ #category : #attributes }
HtmlTextArea >> wrapSoft [
	^ self wrap: #soft
]
