Class {
	#name : #ELPathSegmentIgnoringCase,
	#superclass : #ELPathSegment,
	#category : 'Eleven-Handlers'
}

{ #category : #private }
ELPathSegmentIgnoringCase >> matcherClass [
	^ ELCaseInsensitiveStringMatcher
]
