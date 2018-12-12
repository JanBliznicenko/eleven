Class {
	#name : #HtmlObject,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #accessing }
HtmlObject >> data: aString [
	self attributeAt: #data put: aString
]

{ #category : #accessing }
HtmlObject >> tagName [
	^ #object
]

{ #category : #accessing }
HtmlObject >> type: aString [
	self attributeAt: #type put: aString
]
