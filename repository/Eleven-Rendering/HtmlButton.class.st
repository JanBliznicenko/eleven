Class {
	#name : #HtmlButton,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlButton >> autofocus: aBoolean [
	^ self
		attributeAt: #autofocus
		put: aBoolean
]

{ #category : #attributes }
HtmlButton >> beButton [
	^ self type: #button
]

{ #category : #attributes }
HtmlButton >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlButton >> beFocused [
	^ self autofocus: true
]

{ #category : #attributes }
HtmlButton >> beMenu [
	^ self type: #menu
]

{ #category : #attributes }
HtmlButton >> beSubmit [
	^ self type: #submit
]

{ #category : #attributes }
HtmlButton >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #initialization }
HtmlButton >> initialize [
	super initialize.
	self beSubmit
]

{ #category : #attributes }
HtmlButton >> name: aString [
	^ self attributeAt: #name put: aString
]

{ #category : #accessing }
HtmlButton >> tagName [
	^ #button
]

{ #category : #attributes }
HtmlButton >> type: aString [
	(#(button submit reset menu) includes: aString)
		ifFalse: [ self error: 'Invalid button type.' ].
	^ self attributeAt: #type put: aString
]

{ #category : #attributes }
HtmlButton >> value: aString [
	^ self
		attributeAt: #value
		put: aString asString
]
