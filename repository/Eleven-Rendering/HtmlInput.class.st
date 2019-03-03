Class {
	#name : #HtmlInput,
	#superclass : #ELEmptyHtmlTag,
	#traits : 'ELTFormItemTag',
	#classTraits : 'ELTFormItemTag classTrait',
	#category : #'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlInput class >> with: aString [
	^ self new
			with: aString
]

{ #category : #attributes }
HtmlInput >> autofocus: aBoolean [
	^ self
		attributeAt: #autofocus
		put: aBoolean
]

{ #category : #attributes }
HtmlInput >> beDisabled [
	^ self disabled: true
]

{ #category : #attributes }
HtmlInput >> beFocused [
	^ self autofocus: true
]

{ #category : #attributes }
HtmlInput >> beRequired [
	^ self required: true
]

{ #category : #attributes }
HtmlInput >> disabled: aBoolean [
	^ self
		attributeAt: #disabled
		put: aBoolean
]

{ #category : #attributes }
HtmlInput >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #rendering }
HtmlInput >> renderAttributesOn: aStream [
	aStream
		nextPutAll: ' type="';
		nextPutAll: self type;
		nextPut: $".
	
	super renderAttributesOn: aStream
]

{ #category : #attributes }
HtmlInput >> required: aBoolean [
	^ self
		attributeAt: #required
		put: aBoolean
]

{ #category : #accessing }
HtmlInput >> tagName [
	^ #input
]

{ #category : #accessing }
HtmlInput >> type [
	^ self subclassResponsibility
]

{ #category : #attributes }
HtmlInput >> value: aString [
	^ self
		attributeAt: #value
		put: (aString ifNotNil: [ aString asString ])
]

{ #category : #attributes }
HtmlInput >> with: aString [
	^ self value: aString
]
