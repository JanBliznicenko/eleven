Class {
	#name : #ELLink,
	#superclass : #Object,
	#instVars : [
		'path',
		'queryString'
	],
	#category : 'Eleven-Handlers-Linking'
}

{ #category : #private }
ELLink class >> buildQueryString: aDictionary [
	^ aDictionary
			ifEmpty: [ '' ]
			ifNotEmpty: [ '?' , ((aDictionary associations collect: [ :each | each key , '=' , each value ]) joinUsing: $&) ]
]

{ #category : #'instance creation' }
ELLink class >> path: pathString query: queryDictionary [
	^ self new
			path: pathString;
			queryString: (self buildQueryString: queryDictionary)
]

{ #category : #'instance creation' }
ELLink class >> path: pathString queryString: queryString [
	^ self new
			path: pathString;
			queryString: queryString
]

{ #category : #building }
ELLink >> build [
	^ self buildPath ,
		self buildQueryString
]

{ #category : #building }
ELLink >> buildPath [
	^ path
]

{ #category : #building }
ELLink >> buildPathWith: aDictionary [
	^ path format: aDictionary
]

{ #category : #building }
ELLink >> buildQueryString [
	^ queryString
]

{ #category : #building }
ELLink >> buildQueryStringWith: aDictionary [
	^ queryString format: aDictionary
]

{ #category : #building }
ELLink >> buildWith: aDictionary [
	^ (self buildPathWith: aDictionary) ,
		(self buildQueryStringWith: aDictionary)
]

{ #category : #private }
ELLink >> path: aString [
	path := aString
]

{ #category : #private }
ELLink >> queryString: aString [
	queryString := aString
]

{ #category : #accessing }
ELLink >> url [
	^ self urlString asUrl
]

{ #category : #accessing }
ELLink >> url: aDictionary [
	^ (self urlString: aDictionary) asUrl
]

{ #category : #accessing }
ELLink >> urlString [
	^ self build
]

{ #category : #accessing }
ELLink >> urlString: aDictionary [
	^ self buildWith: aDictionary
]
