Class {
	#name : #ELDecoration,
	#superclass : #ELComponent,
	#instVars : [
		'innerComponent'
	],
	#category : 'Eleven-Rendering-Decorations'
}

{ #category : #'instance creation' }
ELDecoration class >> new [
	self error: 'Please use #with: and specify the inner component of a decoration.'
]

{ #category : #'instance creation' }
ELDecoration class >> with: aComponent [
	^ self basicNew initialize
			innerComponent: aComponent
]

{ #category : #'instance creation' }
ELDecoration class >> with: firstObject with: secondObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject)
]

{ #category : #'instance creation' }
ELDecoration class >> with: firstObject with: secondObject with: thirdObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject)
]

{ #category : #'instance creation' }
ELDecoration class >> with: firstObject with: secondObject with: thirdObject with: fourthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject)
]

{ #category : #'instance creation' }
ELDecoration class >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject
				with: fifthObject)
]

{ #category : #'instance creation' }
ELDecoration class >> with: firstObject with: secondObject with: thirdObject with: fourthObject with: fifthObject with: sixthObject [
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject
				with: fourthObject
				with: fifthObject
				with: sixthObject)
]

{ #category : #rendering }
ELDecoration >> buildFor: request [
	^ self innerComponent
]

{ #category : #accessing }
ELDecoration >> innerComponent [
	^ innerComponent
]

{ #category : #private }
ELDecoration >> innerComponent: aComponent [
	innerComponent := aComponent
]
