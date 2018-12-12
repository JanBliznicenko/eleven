"
ELEmbeddedHtml outputs a portion of *unchecked* and *unescaped* HTML code to the response. To be used only for 100% trusted strings, otherwise there is a risk of introducing a severe vulnerability. Use at your own risk!
"
Class {
	#name : #ELEmbeddedHtml,
	#superclass : #ELElement,
	#instVars : [
		'verbatimHtml'
	],
	#category : 'Eleven-Rendering-HTML'
}

{ #category : #'instance creation' }
ELEmbeddedHtml class >> withUncheckedAndUnescapedHtml: aString [
	^ self new
			uncheckedAndUnescapedHtml: aString
]

{ #category : #rendering }
ELEmbeddedHtml >> renderFor: request on: aStream [
	"Outputs HTML code verbatim (no checks, no escaping)."
	aStream nextPutAll: verbatimHtml
]

{ #category : #private }
ELEmbeddedHtml >> uncheckedAndUnescapedHtml: aString [
	verbatimHtml := aString
]
