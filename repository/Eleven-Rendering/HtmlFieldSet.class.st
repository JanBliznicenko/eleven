Class {
	#name : #HtmlFieldSet,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlFieldSet >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlFieldSet >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlFieldSet >> name: aString [
	^ self
		attributeAt: #name
]

{ #category : #accessing }
HtmlFieldSet >> tagName [
	^ #fieldset
]
