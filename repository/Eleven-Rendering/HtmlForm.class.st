Class {
	#name : #HtmlForm,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlForm class >> get [
	^ self new beGet
]

{ #category : #'instance creation' }
HtmlForm class >> post [
	^ self new bePost
]

{ #category : #attributes }
HtmlForm >> acceptCharset: aString [
	^ self
		attributeAt: #'accept-charset'
		put: aString
]

{ #category : #attributes }
HtmlForm >> action: aString [
	^ self
		attributeAt: #action
		put: aString
]

{ #category : #attributes }
HtmlForm >> autocomplete: aBooleanOrString [
	^ self
		attributeAt: #autocomplete
		put: (self onOffString: aBooleanOrString)
]

{ #category : #attributes }
HtmlForm >> beGet [
	^ self method: #GET
]

{ #category : #attributes }
HtmlForm >> beMultipart [
	^ self encodingType: ELContentType multipartForm
]

{ #category : #attributes }
HtmlForm >> bePost [
	^ self method: #POST
]

{ #category : #attributes }
HtmlForm >> dontAutocomplete [
	^ self autocomplete: false
]

{ #category : #attributes }
HtmlForm >> dontValidate [
	^ self
		attributeAt: #novalidate
		put: true
]

{ #category : #attributes }
HtmlForm >> encodingType: aContentTypeOrString [
	^ self
		attributeAt: #enctype
		put: aContentTypeOrString value
]

{ #category : #attributes }
HtmlForm >> method: aString [
	(#(GET POST get post nil) includes: aString) ifFalse: [
		self error: 'Unknown HTTP method for form submission.' ].
	
	^ self
		attributeAt: #method
		put: (aString ifNotNil: [ aString asLowercase ])
]

{ #category : #attributes }
HtmlForm >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #accessing }
HtmlForm >> tagName [
	^ #form
]

{ #category : #attributes }
HtmlForm >> target: aString [
	^ self
		attributeAt: #target
		put: aString
]

{ #category : #attributes }
HtmlForm >> url: aString [
	^ self action: aString
]
