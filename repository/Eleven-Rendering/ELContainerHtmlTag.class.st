Class {
	#name : #ELContainerHtmlTag,
	#superclass : #ELHtmlTag,
	#instVars : [
		'content'
	],
	#category : 'Eleven-Rendering-HTML'
}

{ #category : #'instance creation' }
ELContainerHtmlTag class >> class: aString with: anElement [
	^ (self class: aString) with: anElement
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> class: aString with: firstObject with: secondObject [
	^ (self class: aString) with: firstObject with: secondObject
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> class: aString with: firstObject with: secondObject with: thirdObject [
	^ (self class: aString) with: firstObject with: secondObject with: thirdObject
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> id: anIdString class: aClassString [
	^ (self id: anIdString) class: aClassString
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> id: aString class: aClassString with: anElement [
	^ (self id: aString)
		class: aClassString;
		with: anElement
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> id: aString with: anElement [
	^ (self id: aString) with: anElement
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> title: aTitle with: anElement [
	^ self new
		title: aTitle;
		with: anElement
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: anElement [
	^ self new
			with: anElement
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: firstObject with: secondObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject)
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: firstObject with: secondObject with: thirdObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject)
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: firstObject with: secondObject with: thirdObject with: fourthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject)
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject
				with: fifthObject)
]

{ #category : #'instance creation' }
ELContainerHtmlTag class >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject
				with: fifthObject
				with: sixthObject)
]

{ #category : #accessing }
ELContainerHtmlTag >> add: anObject [
	content isCollection
		ifTrue: [ self with: (Array withAll: content , {anObject}) ]
		ifFalse: [ self with: content with: anObject ]
]

{ #category : #accessing }
ELContainerHtmlTag >> addFirst: anObject [
	content isCollection
		ifTrue: [ self with: {anObject} , (Array withAll: content) ]
		ifFalse: [ self with: anObject with: content ]
]

{ #category : #accessing }
ELContainerHtmlTag >> class: aString with: anObject [
	self class: aString.
	content := anObject
]

{ #category : #testing }
ELContainerHtmlTag >> isEmpty [
	^ content isNil or: [ content isCollection and: [ content isEmpty ] ]
]

{ #category : #rendering }
ELContainerHtmlTag >> renderContentFor: request on: aStream [
	content renderFor: request on: aStream
]

{ #category : #rendering }
ELContainerHtmlTag >> renderEndTagOn: aStream [
	aStream
		nextPut: $<;
		nextPut: $/;
		nextPutAll: self tagName;
		nextPut: $>
]

{ #category : #rendering }
ELContainerHtmlTag >> renderFor: request on: aStream [
	self renderStartTagOn: aStream.
	self renderContentFor: request on: aStream.
	self renderEndTagOn: aStream
]

{ #category : #accessing }
ELContainerHtmlTag >> with: anObject [
	content := anObject
]

{ #category : #accessing }
ELContainerHtmlTag >> with: firstObject with: secondObject [
	^ self with:
		(Array
			with: firstObject
			with: secondObject)
]

{ #category : #accessing }
ELContainerHtmlTag >> with: firstObject with: secondObject with: thirdObject [
	^ self with:
		(Array
			with: firstObject
			with: secondObject
			with: thirdObject)
]

{ #category : #accessing }
ELContainerHtmlTag >> with: firstObject with: secondObject with: thirdObject with: fourthObject [
	^ self with:
		(Array
			with: firstObject
			with: secondObject
			with: thirdObject
			with: fourthObject)
]

{ #category : #accessing }
ELContainerHtmlTag >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject [
	^ self with:
		(Array
			with: firstObject
			with: secondObject
			with: thirdObject
			with: fourthObject
			with: fifthObject)
]

{ #category : #accessing }
ELContainerHtmlTag >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject [
	^ self with:
		(Array
			with: firstObject
			with: secondObject
			with: thirdObject
			with: fourthObject
			with: fifthObject
			with: sixthObject)
]
