Class {
	#name : 'ELRequest',
	#superclass : 'ELMessage',
	#instVars : [
		'application',
		'attributes',
		'method',
		'url',
		'remainingPathSegments',
		'version',
		'headers',
		'cookies',
		'entity',
		'formState',
		'fileUploads',
		'originalRequest'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'accessing' }
ELRequest >> application [
	^ application
]

{ #category : 'private' }
ELRequest >> application: anApplication [
	application := anApplication
]

{ #category : 'accessing - attributes' }
ELRequest >> attributeAt: name [
	^ attributes at: name
]

{ #category : 'accessing - attributes' }
ELRequest >> attributeAt: name ifAbsent: aBlock [
	^ attributes at: name ifAbsent: aBlock
]

{ #category : 'accessing - attributes' }
ELRequest >> attributeAt: name ifPresent: aBlock [
	^ attributes at: name ifPresent: aBlock
]

{ #category : 'accessing - attributes' }
ELRequest >> attributeAt: name ifPresent: presentBlock ifAbsent: absentBlock [
	^ attributes at: name ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'accessing - attributes' }
ELRequest >> attributeAt: name put: aValue [
	^ attributes at: name put: aValue
]

{ #category : 'private' }
ELRequest >> attributes: aDictionary [
	attributes := aDictionary
]

{ #category : 'accessing - cookies' }
ELRequest >> cookieAt: name ifAbsent: absentBlock [
	^ self cookies detect: [ :cookie | cookie name = name ] ifNone: absentBlock
]

{ #category : 'accessing - cookies' }
ELRequest >> cookieAt: name ifPresent: presentBlock [
	^ self cookies detect: [ :cookie | cookie name = name ] ifFound: presentBlock
]

{ #category : 'accessing - cookies' }
ELRequest >> cookieAt: name ifPresent: presentBlock ifAbsent: absentBlock [
	^ self cookies
		detect: [ :cookie | cookie name = name ]
		ifFound: presentBlock
		ifNone: absentBlock
]

{ #category : 'private' }
ELRequest >> cookies [
	^ cookies
		ifNil: [ cookies := headers
				flatCollect: [ :header | 
					header name asLowercase = ELCookie requestHeaderName asLowercase
						ifTrue: [ ELCookie fromHeader: header ]
						ifFalse: [ Array new ] ] ]
]

{ #category : 'accessing' }
ELRequest >> entity [
	^ entity
]

{ #category : 'accessing' }
ELRequest >> entity: anEntity [
	entity := anEntity
]

{ #category : 'accessing - file uploads' }
ELRequest >> fileUploadAt: key [
	^ fileUploads at: key ifAbsent: [ nil ]
]

{ #category : 'accessing - file uploads' }
ELRequest >> fileUploadAt: key ifAbsent: aBlock [
	^ fileUploads at: key ifAbsent: aBlock
]

{ #category : 'private' }
ELRequest >> fileUploads: aDictionary [
	fileUploads := aDictionary
]

{ #category : 'accessing - file uploads' }
ELRequest >> fileUploadsAt: key ifAbsent: aBlock [
	| uploads |
	
	uploads := fileUploads at: key ifAbsent: [ ^ aBlock value ].
	
	^ uploads isCollection
			ifTrue: [ uploads ]
			ifFalse: [ Array with: uploads ]
]

{ #category : 'accessing - file uploads' }
ELRequest >> fileUploadsDo: aBlock [
	fileUploads do: aBlock
]

{ #category : 'accessing - path' }
ELRequest >> firstPathSegment [
	^ remainingPathSegments first
]

{ #category : 'accessing' }
ELRequest >> formState [
	^ formState
]

{ #category : 'private' }
ELRequest >> formState: anObject [
	formState := anObject
]

{ #category : 'accessing - path' }
ELRequest >> hasPathSegments [

	^ remainingPathSegments notEmpty and: [
		  remainingPathSegments first ~~ $/ ]
]

{ #category : 'private' }
ELRequest >> headers: aCollection [
	headers := aCollection
]

{ #category : 'accessing' }
ELRequest >> headersDo: aBlock [
	^ headers do: [ :each | aBlock cull: each ]
]

{ #category : 'initialization' }
ELRequest >> initialize [
	super initialize.
	
	attributes := Dictionary new
]

{ #category : 'accessing' }
ELRequest >> method [
	^ method
]

{ #category : 'private' }
ELRequest >> method: aMethod [
	method := aMethod
]

{ #category : 'private' }
ELRequest >> originalRequest: aRequest [
	originalRequest := aRequest
]

{ #category : 'accessing - path' }
ELRequest >> pathSegments [
	^ remainingPathSegments
]

{ #category : 'private' }
ELRequest >> pathSegments: aCollection [
	remainingPathSegments := aCollection
]

{ #category : 'printing' }
ELRequest >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: method name;
		space;
		print: url;
		space;
		nextPutAll: version;
		nextPut: $)
]

{ #category : 'accessing - query' }
ELRequest >> queries [
	^ url query
]

{ #category : 'accessing - query' }
ELRequest >> queryAt: name [
	^ url queryAt: name
]

{ #category : 'accessing - query' }
ELRequest >> queryAt: name ifAbsent: aBlock [
	^ url queryAt: name ifAbsent: aBlock
]

{ #category : 'accessing - query' }
ELRequest >> queryAt: name ifPresent: aBlock [
	^ url queryAt: name ifPresent: aBlock
]

{ #category : 'accessing - query' }
ELRequest >> queryAt: name ifPresent: presentBlock ifAbsent: absentBlock [
	^ url queryAt: name ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'accessing' }
ELRequest >> session [
	^ originalRequest session
			attributeAt: self sessionKey
			ifAbsentPut: [ self application newSession ]
]

{ #category : 'private' }
ELRequest >> sessionKey [
	^ #elevenSession
]

{ #category : 'accessing - path' }
ELRequest >> url [
	^ url
]

{ #category : 'private' }
ELRequest >> url: aUrl [
	url := aUrl.
	remainingPathSegments := aUrl pathSegments
]

{ #category : 'accessing - path' }
ELRequest >> urlString [
	^ String streamContents: [ :stream | url printOn: stream ]
]

{ #category : 'private' }
ELRequest >> version: aString [
	version := aString
]

{ #category : 'transforming' }
ELRequest >> withApplication: anApplication [
	^ self copy
			application: anApplication
]

{ #category : 'transforming' }
ELRequest >> withAttributeAt: name put: anObject [
	^ self copy
			attributes:
				(attributes copy
					at: name put: anObject;
					yourself)
]

{ #category : 'transforming' }
ELRequest >> withAttributes: aDictionary [
	^ self copy
			attributes:
				(attributes copy
					addAll: aDictionary;
					yourself)
]

{ #category : 'transforming' }
ELRequest >> withFormState: aFormState [
	^ self copy
			formState: aFormState
]

{ #category : 'transforming' }
ELRequest >> withoutFirstPathSegment [
	^ self withoutFirstPathSegments: 1
]

{ #category : 'transforming' }
ELRequest >> withoutFirstPathSegments: aNumber [
	^ self copy pathSegments: (self pathSegments allButFirst: aNumber)
]
