Class {
	#name : 'ELStringMatcher',
	#superclass : 'ELSegmentMatcher',
	#instVars : [
		'string'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'instance creation' }
ELStringMatcher class >> string: aString [
	^ self new
			string: aString
]

{ #category : 'matching' }
ELStringMatcher >> match: aString into: aDictionary [
	^ self matches: aString
]

{ #category : 'matching' }
ELStringMatcher >> matches: aString [
	^ string = aString
]

{ #category : 'private' }
ELStringMatcher >> string: aString [
	string := aString
]
