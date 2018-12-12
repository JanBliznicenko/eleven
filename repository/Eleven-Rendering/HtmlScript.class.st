Class {
	#name : #HtmlScript,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlScript class >> javaScript [
	^ self new
]

{ #category : #'instance creation' }
HtmlScript class >> javaScript: aString [
	^ self with: aString
]

{ #category : #constants }
HtmlScript class >> javaScriptType [
	^ ELContentType javaScript value
]

{ #category : #attributes }
HtmlScript >> async: aBoolean [
	^ self
		attributeAt: #async
		put: aBoolean
]

{ #category : #attributes }
HtmlScript >> beAsync [
	^ self async: true
]

{ #category : #attributes }
HtmlScript >> beDeferred [
	^ self defer: true
]

{ #category : #attributes }
HtmlScript >> characterSet: aString [
	^ self
		attributeAt: #charset
		put: aString
]

{ #category : #attributes }
HtmlScript >> defer: aBoolean [
	^ self
		attributeAt: #defer
		put: aBoolean
]

{ #category : #initialization }
HtmlScript >> initialize [
	super initialize.
	self type: self class javaScriptType.
	content := ''
]

{ #category : #rendering }
HtmlScript >> renderContentFor: request on: aStream [
	content renderUnescapedFor: request on: aStream
]

{ #category : #accessing }
HtmlScript >> tagName [
	^ #script
]

{ #category : #attributes }
HtmlScript >> type: aString [
	^ self
		attributeAt: #type
		put: aString
]

{ #category : #attributes }
HtmlScript >> url: aString [
	^ self
		attributeAt: #src
		put: aString
]
