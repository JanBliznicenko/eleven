Class {
	#name : #HtmlBooleanChoiceInput,
	#superclass : #HtmlInput,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlBooleanChoiceInput >> beChecked [
	^ self checked: true
]

{ #category : #attributes }
HtmlBooleanChoiceInput >> checked: aBoolean [
	^ self
		attributeAt: #checked
		put: aBoolean
]
