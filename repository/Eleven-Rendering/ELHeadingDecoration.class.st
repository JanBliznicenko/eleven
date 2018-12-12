Class {
	#name : #ELHeadingDecoration,
	#superclass : #ELDecoration,
	#instVars : [
		'title',
		'level'
	],
	#category : 'Eleven-Rendering-Decorations'
}

{ #category : #'instance creation' }
ELHeadingDecoration class >> level1: aString with: aComponent [
	^ self title: aString level: 1 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> level2: aString with: aComponent [
	^ self title: aString level: 2 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> level3: aString with: aComponent [
	^ self title: aString level: 3 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> level4: aString with: aComponent [
	^ self title: aString level: 4 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> level5: aString with: aComponent [
	^ self title: aString level: 5 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> level6: aString with: aComponent [
	^ self title: aString level: 6 with: aComponent
]

{ #category : #'instance creation' }
ELHeadingDecoration class >> title: aString level: anInteger with: aComponent [
	^ (self with: aComponent)
			title: aString;
			level: anInteger
]

{ #category : #rendering }
ELHeadingDecoration >> buildFor: request [
	^ Array
			with: (HtmlHeading level: level with: title)
			with: (self innerComponent)
]

{ #category : #private }
ELHeadingDecoration >> level: anInteger [
	level := anInteger
]

{ #category : #private }
ELHeadingDecoration >> title: aString [
	title := aString
]
