Class {
	#name : 'ELPathSegment',
	#superclass : 'ELHandlerDecorator',
	#instVars : [
		'segment',
		'matcher'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'instance creation' }
ELPathSegment class >> handle: aString with: decoratedHandler [
	(aString includes: $/) ifTrue: [
		^ ELPathPattern handle: aString with: decoratedHandler ].
	
	^ (self with: decoratedHandler)
			segment: aString
]

{ #category : 'visiting' }
ELPathSegment >> accept: aVisitor [
	^ aVisitor visitPathSegment: self
]

{ #category : 'request handling' }
ELPathSegment >> handle: request [
	^ (self matches: request)
			ifTrue: [
				decoratedHandler handle: request withoutFirstPathSegment ]
			ifFalse: [
				ELResponse none ]
]

{ #category : 'private' }
ELPathSegment >> matcherClass [
	^ ELStringMatcher
]

{ #category : 'request handling' }
ELPathSegment >> matches: request [
	^ request hasPathSegments and: [ matcher matches: request firstPathSegment ]
]

{ #category : 'printing' }
ELPathSegment >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: segment;
		nextPut: $)
]

{ #category : 'accessing' }
ELPathSegment >> segment [
	 ^ segment
]

{ #category : 'private' }
ELPathSegment >> segment: aString [
	segment := aString.
	matcher := self matcherClass string: aString
]
