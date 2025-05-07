Class {
	#name : 'ELLinkBuilder',
	#superclass : 'ELHandlerVisitor',
	#instVars : [
		'pathSegments',
		'parameters'
	],
	#category : 'Eleven-Handlers-Linking',
	#package : 'Eleven-Handlers',
	#tag : 'Linking'
}

{ #category : 'private' }
ELLinkBuilder >> currentLink [
	^ ELLink path: self currentPath query: self currentQuery
]

{ #category : 'private' }
ELLinkBuilder >> currentPath [
	^ '/' , (pathSegments joinUsing: $/)
]

{ #category : 'private' }
ELLinkBuilder >> currentQuery [
	^ parameters
]

{ #category : 'initialization' }
ELLinkBuilder >> initialize [
	super initialize.
	
	pathSegments := OrderedCollection new.
	parameters := Dictionary new
]

{ #category : 'visiting' }
ELLinkBuilder >> visitChain: aChain [
	aChain elements do: [ :each |
		each accept: self ]
]

{ #category : 'visiting' }
ELLinkBuilder >> visitHandlerDecorator: aHandlerDecorator [
	^ aHandlerDecorator decoratedHandler accept: self
]

{ #category : 'visiting' }
ELLinkBuilder >> visitParameterPresence: aParameterPresence [
	^ self visitParameterValue: aParameterPresence
]

{ #category : 'visiting' }
ELLinkBuilder >> visitParameterValue: aParameterValue [
	| present prevValue |
	
	(present := parameters includesKey: aParameterValue parameter)
		ifTrue: [
			prevValue := parameters at: aParameterValue parameter ].
	
	parameters at: aParameterValue parameter put: aParameterValue value.
	
	aParameterValue decoratedHandler accept: self.
	
	present
		ifTrue: [ parameters at: aParameterValue parameter put: prevValue ]
		ifFalse: [ parameters removeKey: aParameterValue parameter ]
]

{ #category : 'visiting' }
ELLinkBuilder >> visitPathSegment: aPathSegment [
	pathSegments addLast: aPathSegment segment.
	
	aPathSegment decoratedHandler accept: self.
	
	pathSegments removeLast
]
