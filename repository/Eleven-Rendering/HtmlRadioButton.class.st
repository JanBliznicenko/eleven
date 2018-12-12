Class {
	#name : #HtmlRadioButton,
	#superclass : #HtmlBooleanChoiceInput,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlRadioButton >> beSelected [
	^ self selected: true
]

{ #category : #attributes }
HtmlRadioButton >> selected: aBoolean [
	^ self checked: aBoolean
]

{ #category : #accessing }
HtmlRadioButton >> type [
	^ #radio
]
