Class {
	#name : 'ELChain',
	#superclass : 'ELRequestHandler',
	#instVars : [
		'elements'
	],
	#category : 'Eleven-Handlers',
	#package : 'Eleven-Handlers'
}

{ #category : 'instance creation' }
ELChain class >> with: firstHandler [
	^ self withAll: (Array with: firstHandler)
]

{ #category : 'instance creation' }
ELChain class >> with: firstHandler with: secondHandler [
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler)
]

{ #category : 'instance creation' }
ELChain class >> with: firstHandler with: secondHandler with: thirdHandler [
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler)
]

{ #category : 'instance creation' }
ELChain class >> with: firstHandler with: secondHandler with: thirdHandler with: fourthHandler [
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler
				with: fourthHandler)
]

{ #category : 'instance creation' }
ELChain class >> with: firstHandler with: secondHandler with: thirdHandler with: fourthHandler with: fifthHandler [
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler
				with: fourthHandler
				with: fifthHandler)
]

{ #category : 'instance creation' }
ELChain class >> with: firstHandler with: secondHandler with: thirdHandler with: fourthHandler with: fifthHandler with: sixthHandler [
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler
				with: fourthHandler
				with: fifthHandler
				with: sixthHandler)
]

{ #category : 'instance creation' }
ELChain class >> withAll: aCollection [
	^ self new elements: aCollection
]

{ #category : 'visiting' }
ELChain >> accept: aVisitor [
	^ aVisitor visitChain: self
]

{ #category : 'accessing' }
ELChain >> elements [
	^ elements
]

{ #category : 'private' }
ELChain >> elements: aCollection [
	elements := aCollection
]

{ #category : 'request handling' }
ELChain >> handle: request [
	elements do: [ :each |
		(each handle: request)
			responsesFor: request do: [ :response |
				^ response ] ].
	
	^ ELResponse none
]

{ #category : 'printing' }
ELChain >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	elements
		do: [ :each | aStream print: each ]
		separatedBy: [ aStream space ].
	aStream nextPut: $)
]
