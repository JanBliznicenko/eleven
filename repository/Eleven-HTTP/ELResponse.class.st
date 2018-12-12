Class {
	#name : #ELResponse,
	#superclass : #ELMessage,
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #constants }
ELResponse class >> defaultContentType [
	^ ELContentType htmlWithDefaultCharset
]

{ #category : #'instance creation' }
ELResponse class >> empty [
	^ self none
]

{ #category : #'instance creation' }
ELResponse class >> none [
	^ ELNoResponse new
]

{ #category : #converting }
ELResponse >> asResponseFor: request [
	^ self
]

{ #category : #accessing }
ELResponse >> contentType [
	^ self headerAt: ELContentType headerName ifAbsent: [ self class defaultContentType value ]
]

{ #category : #accessing }
ELResponse >> entityStream [
	self entityStreamsDo: [ :entityStream | ^ entityStream ].
	
	^ nil
]

{ #category : #accessing }
ELResponse >> entityStreamsDo: aBlock [
	self subclassResponsibility
]

{ #category : #decorating }
ELResponse >> replacedHeader: aHeader [
	^ ELAddHeader
			header: aHeader
			with:
				(ELRemoveHeader
					name: aHeader name
					with: self)
]

{ #category : #accessing }
ELResponse >> statusCode [
	self subclassResponsibility
]

{ #category : #accessing }
ELResponse >> statusMessage [
	self subclassResponsibility
]

{ #category : #decorating }
ELResponse >> withContentType: aContentType [
	^ self withHeader: aContentType asHeader
]

{ #category : #decorating }
ELResponse >> withCookie: aCookie [
	^ ELSetCookie cookie: aCookie with: self
]

{ #category : #decorating }
ELResponse >> withHeader: aHeader [
	^ ELAddHeader header: aHeader with: self
]

{ #category : #decorating }
ELResponse >> withoutHeader: headerName [
	^ ELRemoveHeader name: headerName with: self
]
