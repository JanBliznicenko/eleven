Class {
	#name : #HtmlEmbed,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlEmbed >> height: anInteger [
	^ self
		attributeAt: #height
		put: anInteger
]

{ #category : #accessing }
HtmlEmbed >> tagName [
	^ #embed
]

{ #category : #attributes }
HtmlEmbed >> type: aMimeTypeOrString [
	^ self
		attributeAt: #type
		put: aMimeTypeOrString asString
]

{ #category : #attributes }
HtmlEmbed >> url: aStringOrUrl [
	^ self
		attributeAt: #src
		put: aStringOrUrl asString
]

{ #category : #attributes }
HtmlEmbed >> width: anInteger [
	^ self
		attributeAt: #width
		put: anInteger
]
