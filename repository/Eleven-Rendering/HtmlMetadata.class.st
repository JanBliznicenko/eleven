Class {
	#name : #HtmlMetadata,
	#superclass : #ELEmptyHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlMetadata class >> httpEquivalent: nameString content: contentString [
	^ self new
			httpEquivalent: nameString;
			content: contentString
]

{ #category : #'instance creation' }
HtmlMetadata class >> name: nameString content: contentString [
	^ self new
			name: nameString;
			content: contentString
]

{ #category : #'instance creation' }
HtmlMetadata class >> utf8Charset [
	^ self new
			characterSet: 'utf-8'
]

{ #category : #attributes }
HtmlMetadata >> characterSet: aString [
	^ self
		attributeAt: #charset
		put: aString
]

{ #category : #attributes }
HtmlMetadata >> content: aString [
	^ self
		attributeAt: #content
		put: aString
]

{ #category : #attributes }
HtmlMetadata >> httpEquivalent: aString [
	^ self
		attributeAt: #'http-equiv'
		put: aString
]

{ #category : #attributes }
HtmlMetadata >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #accessing }
HtmlMetadata >> tagName [
	^ #meta
]
