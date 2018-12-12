Class {
	#name : #HtmlSelect,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlSelect >> allowMultipleSelection [
	^ self multipleSelection: true
]

{ #category : #attributes }
HtmlSelect >> autocomplete: aBooleanOrString [
	^ self
		attributeAt: #autocomplete
		put: (self onOffString: aBooleanOrString)
]

{ #category : #attributes }
HtmlSelect >> autofocus: aBoolean [
	^ self
		attributeAt: #autofocus
		put: aBoolean
]

{ #category : #attributes }
HtmlSelect >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlSelect >> beFocused [
	^ self autofocus: true
]

{ #category : #attributes }
HtmlSelect >> beRequired [
	^ self required: true
]

{ #category : #attributes }
HtmlSelect >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlSelect >> dontAutocomplete [
	^ self autocomplete: false
]

{ #category : #attributes }
HtmlSelect >> multipleSelection: aBoolean [
	^ self
		attributeAt: #multiple
		put: aBoolean
]

{ #category : #attributes }
HtmlSelect >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #attributes }
HtmlSelect >> required: aBoolean [
	^ self
		attributeAt: #required
		put: aBoolean
]

{ #category : #attributes }
HtmlSelect >> size: anInteger [
	^ self
		attributeAt: #size
		put: anInteger
]

{ #category : #accessing }
HtmlSelect >> tagName [
	^ #select
]
