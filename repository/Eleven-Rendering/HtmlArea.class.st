Class {
	#name : #HtmlArea,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlArea >> altText: aString [
	^ self
		attributeAt: #alt
		put: aString
]

{ #category : #accessing }
HtmlArea >> tagName [
	^ #area
]
