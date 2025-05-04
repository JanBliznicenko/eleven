Class {
	#name : 'ELCookie',
	#superclass : 'Object',
	#instVars : [
		'name',
		'value',
		'expiration',
		'domain',
		'path',
		'httpOnly',
		'secure'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'instance creation' }
ELCookie class >> fromHeader: aHeader [
	^ Array
		streamContents: [ :cookieStream | 
			(aHeader value substrings: #($;))
				do: [ :pair | 
					| separatorPosition |
					separatorPosition := pair indexOf: $=.
					separatorPosition = 0
						ifTrue: [ cookieStream nextPut: (self name: pair value: '') ]
						ifFalse:
							[ cookieStream nextPut: (self name: (pair first: separatorPosition - 1) trimmed value: (pair allButFirst: separatorPosition) trimmed) ] ] ]
]

{ #category : 'instance creation' }
ELCookie class >> name: nameString value: value [
	^ self new
		name: nameString;
		value: value;
		yourself
]

{ #category : 'constants' }
ELCookie class >> reponseHeaderName [
	^ #'Set-Cookie'
]

{ #category : 'constants' }
ELCookie class >> requestHeaderName [
	^ #Cookie
]

{ #category : 'converting' }
ELCookie >> asRemovalCookie [
	^ self class new
			name: name
			value: '';
			expiration: DateAndTime unixEpoch;
			domain: domain;
			path: path
]

{ #category : 'converting' }
ELCookie >> asRemovalResponseHeader [
	^ self asRemovalCookie asResponseHeader
]

{ #category : 'converting' }
ELCookie >> asResponseHeader [
	^ ELHeader
			name: self class reponseHeaderName
			value: name , '=' , value
			attributes:
				{
					#Expires -> (expiration ifNotNil: [ expiration asEmailString ]).
					#Domain -> domain.
					#Path -> path.
					#HttpOnly -> httpOnly.
					#Secure -> secure
				} asDictionary
]

{ #category : 'accessing' }
ELCookie >> domain [
	^ domain
]

{ #category : 'accessing' }
ELCookie >> domain: anObject [
	domain := anObject
]

{ #category : 'accessing' }
ELCookie >> expiration [
	^ expiration
]

{ #category : 'accessing' }
ELCookie >> expiration: anObject [
	expiration := anObject
]

{ #category : 'accessing' }
ELCookie >> httpOnly [
	^ httpOnly
]

{ #category : 'accessing' }
ELCookie >> httpOnly: anObject [
	httpOnly := anObject
]

{ #category : 'accessing' }
ELCookie >> name [
	^ name
]

{ #category : 'accessing' }
ELCookie >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
ELCookie >> path [
	^ path
]

{ #category : 'accessing' }
ELCookie >> path: anObject [
	path := anObject
]

{ #category : 'printing' }
ELCookie >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	self writeTo: aStream.
	aStream nextPut: $)
]

{ #category : 'accessing' }
ELCookie >> secure [
	^ secure
]

{ #category : 'accessing' }
ELCookie >> secure: anObject [
	secure := anObject
]

{ #category : 'accessing' }
ELCookie >> value [
	^ value
]

{ #category : 'accessing' }
ELCookie >> value: anObject [
	value := anObject
]

{ #category : 'printing' }
ELCookie >> writeTo: aStream [
	aStream
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: value
]
