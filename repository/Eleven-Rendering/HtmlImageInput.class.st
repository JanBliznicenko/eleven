Class {
	#name : #HtmlImageInput,
	#superclass : #HtmlInput,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlImageInput >> altText: aString [
	^ self
		attributeAt: #alt
		put: aString
]

{ #category : #accessing }
HtmlImageInput >> tagName [
	^ #input
]

{ #category : #attributes }
HtmlImageInput >> url: aString [
	^ self
		attributeAt: #src
		put: aString
]
