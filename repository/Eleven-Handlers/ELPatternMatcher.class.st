Class {
	#name : 'ELPatternMatcher',
	#superclass : 'ELSegmentMatcher',
	#instVars : [
		'parameter'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'instance creation' }
ELPatternMatcher class >> fromString: aString [
	^ self new
			parameter: aString allButFirst allButLast
]

{ #category : 'matching' }
ELPatternMatcher >> match: aString into: aDictionary [
	aString ifEmpty: [ ^ false ].
	
	aDictionary at: parameter put: aString.
	
	^ true
]

{ #category : 'private' }
ELPatternMatcher >> parameter: aString [
	parameter := aString
]
