Class {
	#name : #HtmlListItem,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #accessing }
HtmlListItem >> tagName [
	^ #li
]

{ #category : #attributes }
HtmlListItem >> value: anInteger [
	^ self
		attributeAt: #value
		put: anInteger asString
]
