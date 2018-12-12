Class {
	#name : #HtmlHeading,
	#superclass : #ELContainerHtmlTag,
	#category : 'Eleven-Rendering-HTML-Tags'
}

{ #category : #'instance creation' }
HtmlHeading class >> level1 [
	^ HtmlHeadingLevel1 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level1: anElement [
	^ self level1 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level2 [
	^ HtmlHeadingLevel2 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level2: anElement [
	^ self level2 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level3 [
	^ HtmlHeadingLevel3 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level3: anElement [
	^ self level3 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level4 [
	^ HtmlHeadingLevel4 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level4: anElement [
	^ self level4 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level5 [
	^ HtmlHeadingLevel5 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level5: anElement [
	^ self level5 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level6 [
	^ HtmlHeadingLevel6 new
]

{ #category : #'instance creation' }
HtmlHeading class >> level6: anElement [
	^ self level6 with: anElement
]

{ #category : #'instance creation' }
HtmlHeading class >> level: anInteger [
	^ ({
			HtmlHeadingLevel1.
			HtmlHeadingLevel2.
			HtmlHeadingLevel3.
			HtmlHeadingLevel4.
			HtmlHeadingLevel5.
			HtmlHeadingLevel6
		} at: anInteger ifAbsent: [
				self error: 'Heading level must be between 1 and 6.' ])
					new
]

{ #category : #'instance creation' }
HtmlHeading class >> level: anInteger with: anElement [
	^ (self level: anInteger)
			with: anElement
]

{ #category : #accessing }
HtmlHeading >> level [
	self subclassResponsibility
]

{ #category : #accessing }
HtmlHeading >> tagName [
	^ ('h' , self level asString) asSymbol
]
