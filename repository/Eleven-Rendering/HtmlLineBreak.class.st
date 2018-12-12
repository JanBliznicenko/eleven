Class {
	#name : #HtmlLineBreak,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'string manipulation' }
HtmlLineBreak class >> breakString: aString [
	aString ifEmpty: [ ^ aString ].
	
	^ (Array streamContents: [ :stream |
			aString linesDo: [ :each |
				stream nextPut: each.
				stream nextPut: self new ] ]) allButLast
]

{ #category : #accessing }
HtmlLineBreak >> tagName [
	^ #br
]
