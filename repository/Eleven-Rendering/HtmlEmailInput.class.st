Class {
	#name : #HtmlEmailInput,
	#superclass : #HtmlTextInput,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlEmailInput >> allowMultipleValues [
	^ self multiple: true
]

{ #category : #attributes }
HtmlEmailInput >> multiple: aBoolean [
	^ self
		attributeAt: #multiple
		put: aBoolean
]

{ #category : #accessing }
HtmlEmailInput >> type [
	^ #email
]
