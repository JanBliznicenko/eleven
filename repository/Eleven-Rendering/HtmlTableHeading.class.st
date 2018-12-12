Class {
	#name : #HtmlTableHeading,
	#superclass : #HtmlTableCell,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlTableHeading >> abbreviation: aString [
	^ self
		attributeAt: #abbr
		put: aString
]

{ #category : #accessing }
HtmlTableHeading >> tagName [
	^ #th
]
