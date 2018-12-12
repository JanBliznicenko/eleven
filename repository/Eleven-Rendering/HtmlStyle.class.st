Class {
	#name : #HtmlStyle,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlStyle >> beScoped [
	^ self scoped: true
]

{ #category : #attributes }
HtmlStyle >> scoped: aBoolean [
	^ self
		attributeAt: #scoped
		put: aBoolean
]

{ #category : #accessing }
HtmlStyle >> tagName [
	^ #style
]

{ #category : #attributes }
HtmlStyle >> type: aString [
	^ self
		attributeAt: #type
		put: aString
]
