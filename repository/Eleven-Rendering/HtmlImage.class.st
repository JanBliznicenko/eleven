Class {
	#name : #HtmlImage,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #accessing }
HtmlImage class >> class: aClass url: aString altText: aText [
	^ self new
		class: aClass;
		url: aString;
		altText: aText;
		title: aText;
		yourself
]

{ #category : #accessing }
HtmlImage class >> url: aString altText: aText [
	^ self new
		url: aString;
		altText: aText;
		title: aText;
		yourself
]

{ #category : #attributes }
HtmlImage >> altText: aString [
	^ self
		attributeAt: #alt
		put: aString
]

{ #category : #attributes }
HtmlImage >> height: anInteger [
	^ self
		attributeAt: #height
		put: anInteger
]

{ #category : #accessing }
HtmlImage >> tagName [
	^ #img
]

{ #category : #attributes }
HtmlImage >> url: aString [
	^ self
		attributeAt: #src
		put: aString
]

{ #category : #attributes }
HtmlImage >> width: anInteger [
	^ self
		attributeAt: #width
		put: anInteger
]
