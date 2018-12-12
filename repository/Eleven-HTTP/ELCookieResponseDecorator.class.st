Class {
	#name : #ELCookieResponseDecorator,
	#superclass : #ELResponseDecorator,
	#instVars : [
		'cookie'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELCookieResponseDecorator class >> cookie: aCookie with: decoratedResponse [
	^ (self with: decoratedResponse)
			cookie: aCookie
]

{ #category : #private }
ELCookieResponseDecorator >> cookie: aCookie [
	cookie := aCookie
]
