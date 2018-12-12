Class {
	#name : #HtmlAnchor,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlAnchor class >> url: aStringOrUrl targetBlankWith: anObject [
	^ self new
		url: aStringOrUrl;
		with: anObject;
		targetBlank;
		yourself
]

{ #category : #'instance creation' }
HtmlAnchor class >> url: aStringOrUrl title: aTitle targetBlankWith: anObject [
	^ self new
		url: aStringOrUrl;
		title: aTitle;
		with: anObject;
		targetBlank;
		yourself
]

{ #category : #'instance creation' }
HtmlAnchor class >> url: aStringOrUrl title: aTitle with: anObject [
	^ self new
		url: aStringOrUrl;
		title: aTitle;
		with: anObject
]

{ #category : #'instance creation' }
HtmlAnchor class >> url: aStringOrUrl with: anObject [
	^ self new
			url: aStringOrUrl;
			with: anObject
]

{ #category : #attributes }
HtmlAnchor >> downloadAs: aString [
	^ self
		attributeAt: #download
		put: aString
]

{ #category : #attributes }
HtmlAnchor >> email: aString [
	^ self href: 'mailto:' , aString
]

{ #category : #attributes }
HtmlAnchor >> href: aStringOrUrl [
	^ self
		attributeAt: #href
		put: aStringOrUrl asString
]

{ #category : #attributes }
HtmlAnchor >> openInNewWindow [
	^ self target: '_blank'
]

{ #category : #attributes }
HtmlAnchor >> relationship: aString [
	^ self attributeAt: #rel put: aString
]

{ #category : #accessing }
HtmlAnchor >> tagName [
	^ #a
]

{ #category : #attributes }
HtmlAnchor >> target: aString [
	"adds noopener and noreferer to all _blank anchors to prevent referer exploiting and improve RNG preformance"

	aString = #_blank
		ifTrue: [ self relationship: 'noopener noreferrer' ].
	^ self attributeAt: #target put: aString
]

{ #category : #attributes }
HtmlAnchor >> targetBlank [
	^ self target: #_blank
]

{ #category : #attributes }
HtmlAnchor >> targetLanguage: aString [
	^ self
		attributeAt: #hreflang
		put: aString
]

{ #category : #attributes }
HtmlAnchor >> telephone: aString [
	^ self href: 'tel:' , aString
]

{ #category : #attributes }
HtmlAnchor >> type: aString [
	^ self
		attributeAt: #type
		put: aString
]

{ #category : #attributes }
HtmlAnchor >> url: aStringOrUrl [
	^ self href: aStringOrUrl
]
