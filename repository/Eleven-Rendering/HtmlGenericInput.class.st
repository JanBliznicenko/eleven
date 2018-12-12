Class {
	#name : #HtmlGenericInput,
	#superclass : #HtmlInput,
	#instVars : [
		'type'
	],
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlGenericInput class >> type: aString [
	^ self new
		type: aString
]

{ #category : #accessing }
HtmlGenericInput >> type [
	^ type
]

{ #category : #accessing }
HtmlGenericInput >> type: aString [
	type := aString
]
