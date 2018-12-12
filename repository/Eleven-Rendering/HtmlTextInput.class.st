Class {
	#name : #HtmlTextInput,
	#superclass : #HtmlInput,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlTextInput >> autocomplete: aBooleanOrString [
	^ self
		attributeAt: #autocomplete
		put: (self onOffString: aBooleanOrString)
]

{ #category : #attributes }
HtmlTextInput >> beReadOnly [
	^ self readOnly: true
]

{ #category : #attributes }
HtmlTextInput >> dontAutocomplete [
	^ self autocomplete: false
]

{ #category : #attributes }
HtmlTextInput >> maxLength: anInteger [
	^ self
		attributeAt: #maxlength
		put: anInteger
]

{ #category : #attributes }
HtmlTextInput >> pattern: aString [
	^ self
		attributeAt: #pattern
]

{ #category : #attributes }
HtmlTextInput >> placeholder: aString [
	^ self
		attributeAt: #placeholder
		put: aString
]

{ #category : #attributes }
HtmlTextInput >> readOnly: aBoolean [
	^ self
		attributeAt: #readonly
		put: aBoolean
]

{ #category : #attributes }
HtmlTextInput >> size: anInteger [
	^ self
		attributeAt: #size
		put: anInteger
]

{ #category : #accessing }
HtmlTextInput >> type [
	^ #text
]
