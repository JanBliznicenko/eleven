Class {
	#name : 'ELCallback',
	#superclass : 'Object',
	#instVars : [
		'block'
	],
	#category : 'Eleven-Handlers-Callbacks',
	#package : 'Eleven-Handlers',
	#tag : 'Callbacks'
}

{ #category : 'constants' }
ELCallback class >> parameterName [
	^ #k
]

{ #category : 'instance creation' }
ELCallback class >> with: aBlock [
	^ self new
			block: aBlock
]

{ #category : 'accessing' }
ELCallback >> block: anObject [
	block := anObject
]

{ #category : 'registering' }
ELCallback >> registerIn: aSession [
	^ aSession registerCallback: self
]

{ #category : 'evaluating' }
ELCallback >> valueForRequest: request withKey: key [
	^ block cull: request
]
