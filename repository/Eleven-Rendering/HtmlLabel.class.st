Class {
	#name : #HtmlLabel,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlLabel class >> for: aStringOrElement with: content [
	^ self new
			for: aStringOrElement;
			with: content
]

{ #category : #attributes }
HtmlLabel >> for: aStringOrTag [
	aStringOrTag isHtmlTag ifTrue: [
		^ self for: aStringOrTag id ].
	
	^ self
		attributeAt: #for
		put: aStringOrTag
]

{ #category : #accessing }
HtmlLabel >> tagName [
	^ #label
]
