Class {
	#name : #ELCaseInsensitiveStringMatcher,
	#superclass : #ELStringMatcher,
	#category : 'Eleven-Handlers'
}

{ #category : #matching }
ELCaseInsensitiveStringMatcher >> matches: aString [
	^ string asLowercase = aString asLowercase
]
