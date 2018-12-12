Class {
	#name : #ELSegmentMatcher,
	#superclass : #Object,
	#category : 'Eleven-Handlers'
}

{ #category : #'instance creation' }
ELSegmentMatcher class >> from: aString [
	^ (aString includes: ${)
			ifTrue: [
				ELPatternMatcher fromString: aString ]
			ifFalse: [
				ELStringMatcher string: aString ]
]

{ #category : #matching }
ELSegmentMatcher >> match: aString into: aDictionary [
	self subclassResponsibility
]
