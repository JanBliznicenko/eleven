Class {
	#name : #HtmlBase,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlBase >> href: aStringOrUrl [
	^ self
		attributeAt: #href
		put: aStringOrUrl asString
]

{ #category : #accessing }
HtmlBase >> tagName [
	^ #base
]

{ #category : #attributes }
HtmlBase >> url: aStringOrUrl [
	^ self href: aStringOrUrl
]
