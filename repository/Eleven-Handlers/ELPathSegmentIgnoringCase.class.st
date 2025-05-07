Class {
	#name : 'ELPathSegmentIgnoringCase',
	#superclass : 'ELPathSegment',
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'private' }
ELPathSegmentIgnoringCase >> matcherClass [
	^ ELCaseInsensitiveStringMatcher
]
