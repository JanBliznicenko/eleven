Class {
	#name : 'ELMethod',
	#superclass : 'Object',
	#classVars : [
		'MethodsByName'
	],
	#classInstVars : [
		'instance'
	],
	#category : 'Eleven-HTTP-Methods',
	#package : 'Eleven-HTTP',
	#tag : 'Methods'
}

{ #category : 'accessing' }
ELMethod class >> delete [
	^ ELDeleteMethod instance
]

{ #category : 'accessing' }
ELMethod class >> get [
	^ ELGetMethod instance
]

{ #category : 'accessing' }
ELMethod class >> head [
	^ ELHeadMethod instance
]

{ #category : 'initialization' }
ELMethod class >> initializeInstances [
	MethodsByName :=
		({ELDeleteMethod. ELGetMethod. ELHeadMethod. ELPatchMethod. ELPostMethod. ELPutMethod}
			collect: [ :each | each instance name -> each instance ])
				asDictionary
]

{ #category : 'instance creation' }
ELMethod class >> instance [
	^ instance ifNil: [ instance := self basicNew initialize ]
]

{ #category : 'accessing' }
ELMethod class >> named: aString [
	MethodsByName ifNil: [ self initializeInstances ].
	
	^ MethodsByName at: aString
]

{ #category : 'instance creation' }
ELMethod class >> new [
	"Do not create new objects, reuse existing ones instead."
	^ self instance
]

{ #category : 'accessing' }
ELMethod class >> patch [
	^ ELPatchMethod instance
]

{ #category : 'accessing' }
ELMethod class >> post [
	^ ELPostMethod instance
]

{ #category : 'accessing' }
ELMethod class >> put [
	^ ELPutMethod instance
]

{ #category : 'accessing' }
ELMethod >> name [
	self subclassResponsibility
]

{ #category : 'printing' }
ELMethod >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: self name;
		nextPut: $)
]
