Class {
	#name : #HtmlOption,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlOption >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlOption >> beSelected [
	^ self selected: true
]

{ #category : #attributes }
HtmlOption >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlOption >> label: aString [
	^ self
		attributeAt: #label
		put: aString
]

{ #category : #attributes }
HtmlOption >> selected: aBoolean [
	^ self
		attributeAt: #selected
		put: aBoolean
]

{ #category : #accessing }
HtmlOption >> tagName [
	^ #option
]

{ #category : #attributes }
HtmlOption >> value: aString [
	^ self
		attributeAt: #value
		put: aString asString
]
