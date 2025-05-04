Class {
	#name : 'ELStreamWrapper',
	#superclass : 'Object',
	#instVars : [
		'stream'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'instance creation' }
ELStreamWrapper class >> on: aStream [
	^ self new
		stream: aStream
]

{ #category : 'character writing' }
ELStreamWrapper >> cr [
	self nextPut: Character cr
]

{ #category : 'character writing' }
ELStreamWrapper >> crlf [
	self
		nextPut: Character cr;
		nextPut: Character lf
]

{ #category : 'character writing' }
ELStreamWrapper >> lf [
	self nextPut: Character lf
]

{ #category : 'reading' }
ELStreamWrapper >> next [
	self subclassResponsibility
]

{ #category : 'reading' }
ELStreamWrapper >> next: anInteger [
	| collection |
	
	collection := Array new: anInteger.
	
	1 to: anInteger do: [ :index |
		collection at: index put: self next ].
	
	^ collection
]

{ #category : 'writing' }
ELStreamWrapper >> nextPut: anObject [
	self subclassResponsibility
]

{ #category : 'writing' }
ELStreamWrapper >> nextPutAll: aCollection [
	aCollection do: [ :each |
		self nextPut: each ].
	
	^ aCollection
]

{ #category : 'writing' }
ELStreamWrapper >> print: anObject [
	anObject printOn: self
]

{ #category : 'character writing' }
ELStreamWrapper >> space [
	self nextPut: Character space
]

{ #category : 'character writing' }
ELStreamWrapper >> space: anInteger [
	anInteger timesRepeat: [ self space ]
]

{ #category : 'private - accessing' }
ELStreamWrapper >> stream: aStream [
	stream := aStream
]

{ #category : 'character writing' }
ELStreamWrapper >> tab [
	self nextPut: Character tab
]

{ #category : 'character writing' }
ELStreamWrapper >> tab: anInteger [
	anInteger timesRepeat: [ self tab ]
]
