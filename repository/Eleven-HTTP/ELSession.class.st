Class {
	#name : 'ELSession',
	#superclass : 'Object',
	#instVars : [
		'attributes',
		'callbacks',
		'csrfTokens',
		'callbackSemaphore'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'accessing' }
ELSession >> attributeAt: key [
	^ attributes at: key
]

{ #category : 'accessing' }
ELSession >> attributeAt: key ifAbsent: aBlock [
	^ attributes at: key ifAbsent: aBlock
]

{ #category : 'accessing' }
ELSession >> attributeAt: key ifAbsentPut: aBlock [
	^ attributes at: key ifAbsentPut: aBlock
]

{ #category : 'accessing' }
ELSession >> attributeAt: key ifPresent: aBlock [
	^ attributes at: key ifPresent: aBlock
]

{ #category : 'accessing' }
ELSession >> attributeAt: key ifPresent: presentBlock ifAbsent: absentBlock [
	^ attributes at: key ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'accessing' }
ELSession >> callbackAt: key [
	^ callbacks at: key
]

{ #category : 'accessing' }
ELSession >> callbackAt: key ifAbsent: aBlock [
	^ callbacks at: key ifAbsent: aBlock
]

{ #category : 'private - atomicity' }
ELSession >> callbackSemaphore [
	^ callbackSemaphore ifNil: [
			callbackSemaphore := Semaphore forMutualExclusion ]
]

{ #category : 'CSRF tokens' }
ELSession >> createCsrfTokenFor: anObject [
	^ self createCsrfTokenFor: anObject valid: 12 hours
]

{ #category : 'CSRF tokens' }
ELSession >> createCsrfTokenFor: anObject valid: aDuration [
	"This method is not atomic, theoretically two same tokens might be generated at the same time but the probability is very low."

	| token |
	[ token := (SharedRandom base64StringOfSize: 22)
		, anObject identityHash asBase64String ]
		doWhileTrue: [ csrfTokens includesKey: token ].
	csrfTokens at: token put: DateAndTime now + aDuration.
	^ token
]

{ #category : 'initialization' }
ELSession >> initialize [
	super initialize.
	
	attributes := Dictionary new.
	callbacks := Dictionary new.
	csrfTokens := Dictionary new
]

{ #category : 'CSRF tokens' }
ELSession >> isValidCsrfToken: aString [
	^ self isValidCsrfToken: aString for: self
]

{ #category : 'CSRF tokens' }
ELSession >> isValidCsrfToken: aString for: anObject [

	[ self validateCsrfToken: aString for: anObject ]
		on: ELCsrfInvalid
		do: [ ^ false ].
	^ true
]

{ #category : 'accessing' }
ELSession >> registerCallback: aCallback [
	| key |
	
	self callbackSemaphore critical: [
		[
			key := UUID new asString36
		] doWhileTrue: [
			callbacks includesKey: key ].
		callbacks at: key put: aCallback ].
	
	^ key
]

{ #category : 'accessing' }
ELSession >> removeCallbackAt: key [
	^ callbacks removeKey: key ifAbsent: []
]

{ #category : 'CSRF tokens' }
ELSession >> validateCsrfToken: aString for: anObject [

	| validity |
	(aString endsWith: anObject identityHash asBase64String) ifFalse: [
		^ ELCsrfInvalid
			  signalReason:
				  'The string does not end with hash of the object - should be '
				  , anObject identityHash asBase64String
			  string: aString
			  object: anObject ].
	validity := csrfTokens at: aString ifAbsent: [
		            ^ ELCsrfInvalid
			              signalReason:
				              'Token not found for the string. Dictionary of validities of tokens: '
				              , csrfTokens asString
			              string: aString
			              object: anObject ].
	validity >= DateAndTime now ifFalse: [
		csrfTokens removeKey: aString.
		^ ELCsrfInvalid
			  signalReason:
				  'Token is no longer valid. Valid until: ' , validity , ', now: '
				  , DateAndTime now
			  string: aString
			  object: anObject ]
]
