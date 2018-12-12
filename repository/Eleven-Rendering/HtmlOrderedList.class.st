Class {
	#name : #HtmlOrderedList,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlOrderedList >> beReversed [
	^ self reversed: true
]

{ #category : #attributes }
HtmlOrderedList >> markerType: aCharacter [
	(#($1 $a $A $i $I) includes: aCharacter) ifFalse: [
		self error: 'Invalid type of list marker.' ].
	
	^ self
		attributeAt: #type
		put: aCharacter asString
]

{ #category : #attributes }
HtmlOrderedList >> reversed: aBoolean [
	^ self
		attributeAt: #reversed
		put: aBoolean
]

{ #category : #attributes }
HtmlOrderedList >> startAt: anInteger [
	^ self
		attributeAt: #start
		put: anInteger
]

{ #category : #accessing }
HtmlOrderedList >> tagName [
	^ #ol
]

{ #category : #attributes }
HtmlOrderedList >> type: aCharacter [
	^ self markerType: aCharacter
]
