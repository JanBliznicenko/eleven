Class {
	#name : #HtmlOptionGroup,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlOptionGroup >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlOptionGroup >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlOptionGroup >> label: aString [
	^ self
		attributeAt: #label
		put: aString
]

{ #category : #accessing }
HtmlOptionGroup >> tagName [
	^ #optgroup
]
