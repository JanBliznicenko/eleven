Class {
	#name : #HtmlTableCell,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlTableCell >> alignToBottom [
	^ self verticalAlign: 'bottom'
]

{ #category : #attributes }
HtmlTableCell >> alignToTop [
	^ self verticalAlign: 'top'
]

{ #category : #attributes }
HtmlTableCell >> columnSpan: anInteger [
	^ self
		attributeAt: 'colspan'
		put: anInteger
]

{ #category : #attributes }
HtmlTableCell >> rowSpan: anInteger [
	^ self
		attributeAt: 'rowspan'
		put: anInteger
]

{ #category : #attributes }
HtmlTableCell >> spanFourColumns [
	self columnSpan: 4
]

{ #category : #attributes }
HtmlTableCell >> spanFourRows [
	self rowSpan: 4
]

{ #category : #attributes }
HtmlTableCell >> spanThreeColumns [
	self columnSpan: 3
]

{ #category : #attributes }
HtmlTableCell >> spanThreeRows [
	self rowSpan: 3
]

{ #category : #attributes }
HtmlTableCell >> spanTwoColumns [
	self columnSpan: 2
]

{ #category : #attributes }
HtmlTableCell >> spanTwoRows [
	self rowSpan: 2
]

{ #category : #attributes }
HtmlTableCell >> verticalAlign: aString [
	^ self
		attributeAt: 'valign'
		put: aString
]
