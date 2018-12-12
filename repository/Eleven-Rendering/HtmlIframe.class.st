Class {
	#name : #HtmlIframe,
	#superclass : #ELEmptyHtmlTag,
	#instVars : [
		'securityRules'
	],
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #attributes }
HtmlIframe >> addSecurityRule: aString [
	"Warning: Cannot be combined with #securityRules:."
	self securityRules add: aString
]

{ #category : #attributes }
HtmlIframe >> allowForms [
	^ self addSecurityRule: 'allow-forms'
]

{ #category : #attributes }
HtmlIframe >> allowPointerLock [
	^ self addSecurityRule: 'allow-pointer-lock'
]

{ #category : #attributes }
HtmlIframe >> allowPopups [
	^ self addSecurityRule: 'allow-popups'
]

{ #category : #attributes }
HtmlIframe >> allowSameOrigin [
	^ self addSecurityRule: 'allow-same-origin'
]

{ #category : #attributes }
HtmlIframe >> allowScripts [
	^ self addSecurityRule: 'allow-scripts'
]

{ #category : #attributes }
HtmlIframe >> allowTopNavigation [
	^ self addSecurityRule: 'allow-top-navigation'
]

{ #category : #attributes }
HtmlIframe >> beSeamless [
	^ self seamless: true
]

{ #category : #attributes }
HtmlIframe >> name: aString [
	^ self
		attributeAt: #name
		put: aString
]

{ #category : #rendering }
HtmlIframe >> renderAttributesOn: aStream [
	securityRules ifNotNil: [
		aStream
			nextPutAll: ' sandbox="';
			nextPutAll: (self collectionToString: securityRules joinedUsing: Character space);
			nextPut: $" ].
	
	super renderAttributesOn: aStream
]

{ #category : #attributes }
HtmlIframe >> seamless: aBoolean [
	^ self
		attributeAt: #seamless
		put: aBoolean
]

{ #category : #attributes }
HtmlIframe >> securityRules [
	^ securityRules ifNil: [
		securityRules := Set new ]
]

{ #category : #attributes }
HtmlIframe >> securityRules: aStringOrCollection [
	"Warning: Cannot be combined with #addSecurityRule: or other shortcut methods."
	^ self
		attributeAt: #sandbox
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)
]

{ #category : #accessing }
HtmlIframe >> tagName [
	^ #iframe
]

{ #category : #attributes }
HtmlIframe >> url: aString [
	^ self
		attributeAt: #src
		put: aString
]
