Class {
	#name : #HtmlDocumentType,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML'
}

{ #category : #'instance creation' }
HtmlDocumentType class >> html5 [
	^ self new
			beHtml5
]

{ #category : #initialization }
HtmlDocumentType >> beHtml5 [
	self attributeAt: #html put: true
]

{ #category : #accessing }
HtmlDocumentType >> tagName [
	^ '!doctype'
]
