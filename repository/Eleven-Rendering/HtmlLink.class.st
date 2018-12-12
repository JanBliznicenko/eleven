Class {
	#name : #HtmlLink,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlLink >> href: aStringOrUrl [
	^ self
		attributeAt: #href
		put: aStringOrUrl asString
]

{ #category : #attributes }
HtmlLink >> media: aString [
	^ self attributeAt: #media put: aString
]

{ #category : #attributes }
HtmlLink >> relationship: aString [
	^ self
		attributeAt: #rel
		put: aString
]

{ #category : #accessing }
HtmlLink >> tagName [
	^ #link
]

{ #category : #attributes }
HtmlLink >> targetLanguage: aString [
	^ self
		attributeAt: #hreflang
		put: aString
]

{ #category : #attributes }
HtmlLink >> type: aString [
	^ self
		attributeAt: #type
		put: aString
]

{ #category : #attributes }
HtmlLink >> url: aStringOrUrl [
	^ self href: aStringOrUrl
]
