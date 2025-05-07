Class {
	#name : 'ELPathPattern',
	#superclass : 'ELHandlerDecorator',
	#instVars : [
		'pattern',
		'patternSegments'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'instance creation' }
ELPathPattern class >> handle: aString with: decoratedHandler [
	^ (self with: decoratedHandler)
			pattern: aString
]

{ #category : 'visiting' }
ELPathPattern >> accept: aVisitor [
	^ aVisitor visitPathPattern: self
]

{ #category : 'request handling' }
ELPathPattern >> handle: request [
	| pathSegments attributes |
	pathSegments := request pathSegments.
	pathSegments size < patternSegments size
		ifTrue: [ ^ ELResponse none ].
	attributes := Dictionary new.
	patternSegments
		withIndexDo: [ :segment :index | 
			(segment match: (pathSegments at: index) into: attributes)
				ifFalse: [ ^ ELResponse none ] ].
	^ decoratedHandler handle: ((request withoutFirstPathSegments: patternSegments size) withAttributes: attributes)
]

{ #category : 'private' }
ELPathPattern >> pattern: aString [
	pattern := aString.
	patternSegments := ($/ split: aString) collect: [ :each | ELSegmentMatcher from: each ]
]

{ #category : 'printing' }
ELPathPattern >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: pattern;
		nextPut: $)
]
