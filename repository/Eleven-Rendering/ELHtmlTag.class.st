Class {
	#name : #ELHtmlTag,
	#superclass : #ELElement,
	#instVars : [
		'attributes',
		'events',
		'classNames',
		'styles'
	],
	#category : 'Eleven-Rendering-HTML'
}

{ #category : #'instance creation' }
ELHtmlTag class >> class: aString [
	^ self new class: aString
]

{ #category : #'instance creation' }
ELHtmlTag class >> id: aString [
	^ self new id: aString
]

{ #category : #attributes }
ELHtmlTag >> accessKey: aStringOrCollection [
	^ self
		attributeAt: #accesskey
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)
]

{ #category : #attributes }
ELHtmlTag >> addClass: aString [
	aString ifEmpty: [ ^ self ].
	(self classNames includes: aString)
		ifTrue: [ ^ self ].
	self classNames add: aString
]

{ #category : #attributes }
ELHtmlTag >> addStyle: aString [
	| colonPosition |
	
	colonPosition := aString indexOf: $: ifAbsent: [ self error: 'Invalid style definition.' ].
	
	^ self
		styleAt: (aString first: colonPosition - 1)
		put: (aString allButFirst: colonPosition)
]

{ #category : #converting }
ELHtmlTag >> asResponseFor: request [
	^ (super asResponseFor: request)
			withContentType: ELContentType htmlWithDefaultCharset
]

{ #category : #attributes }
ELHtmlTag >> attributeAt: key [
	^ self attributes at: key
]

{ #category : #attributes }
ELHtmlTag >> attributeAt: key ifAbsent: aBlock [
	^ self attributes at: key ifAbsent: aBlock
]

{ #category : #attributes }
ELHtmlTag >> attributeAt: key ifPresent: aBlock [
	^ self attributes at: key ifPresent: aBlock
]

{ #category : #attributes }
ELHtmlTag >> attributeAt: key ifPresent: presentBlock ifAbsent: absentBlock [
	^ self attributes at: key ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #attributes }
ELHtmlTag >> attributeAt: key put: value [
	self attributes at: key put: value
]

{ #category : #attributes }
ELHtmlTag >> attributes [
	^ attributes ifNil: [
		attributes := Dictionary new ]
]

{ #category : #attributes }
ELHtmlTag >> buildStyleAttribute [
	^ (self styles associations collect: [ :assoc |
			assoc key , ': ' , assoc value asString ])
				joinUsing: '; '
]

{ #category : #attributes }
ELHtmlTag >> class: aString [
	(aString includes: Character space)
		ifTrue: [ Character space split: aString do: [ :eachClass | self addClass: eachClass ].
			^ self ].
	self addClass: aString
]

{ #category : #attributes }
ELHtmlTag >> class: aString if: aBoolean [
	aBoolean
		ifTrue: [ self class: aString ]
]

{ #category : #attributes }
ELHtmlTag >> classNames [
	^ classNames ifNil: [
		classNames := OrderedCollection new ]
]

{ #category : #helpers }
ELHtmlTag >> collectionToString: aStringOrCollection joinedUsing: aCharacter [
	^ ((aStringOrCollection isCollection
		and: [ aStringOrCollection isString not ])
			ifTrue: [ aStringOrCollection joinUsing: aCharacter ]
			ifFalse: [ aStringOrCollection ])
]

{ #category : #attributes }
ELHtmlTag >> contentEditable: aBoolean [
	^ self
		attributeAt: #contenteditable
		put: aBoolean
]

{ #category : #attributes }
ELHtmlTag >> dataAt: key put: value [
	^ self attributeAt: 'data-' , key put: value
]

{ #category : #attributes }
ELHtmlTag >> direction: aString [
	^ self
		attributeAt: #dir
		put: aString
]

{ #category : #attributes }
ELHtmlTag >> disableTabbing [
	^ self tabIndex: -1
]

{ #category : #attributes }
ELHtmlTag >> draggable: aBoolean [
	^ self
		attributeAt: #draggable
		put: aBoolean
]

{ #category : #attributes }
ELHtmlTag >> dropZone: aStringOrCollection [
	^ self
		attributeAt: #dropzone
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)
]

{ #category : #events }
ELHtmlTag >> events [
	^ events ifNil: [
		events := OrderedCollection new ]
]

{ #category : #attributes }
ELHtmlTag >> hidden: aBoolean [
	^ self
		attributeAt: #hidden
		put: aBoolean
]

{ #category : #attributes }
ELHtmlTag >> id [
	^ self attributeAt: #id ifAbsent: [ nil ]
]

{ #category : #attributes }
ELHtmlTag >> id: aString [
	^ self
		attributeAt: #id
		put: aString
]

{ #category : #attributes }
ELHtmlTag >> idOrName [
	^ self id ifNil: [
		self attributeAt: #name ]
]

{ #category : #testing }
ELHtmlTag >> isHtmlTag [
	^ true
]

{ #category : #attributes }
ELHtmlTag >> language: aString [
	^ self
		attributeAt: #lang
		put: aString
]

{ #category : #events }
ELHtmlTag >> on: eventName do: aBlock [
	self events add:
		eventName -> aBlock
]

{ #category : #events }
ELHtmlTag >> onAbort: aBlock [
	^ self on: #abort do: aBlock
]

{ #category : #events }
ELHtmlTag >> onBlur: aBlock [
	^ self on: #blur do: aBlock
]

{ #category : #events }
ELHtmlTag >> onCancel: aBlock [
	^ self on: #cancel do: aBlock
]

{ #category : #events }
ELHtmlTag >> onChange: aBlock [
	^ self on: #change do: aBlock
]

{ #category : #events }
ELHtmlTag >> onClick: aBlock [
	^ self on: #click do: aBlock
]

{ #category : #events }
ELHtmlTag >> onClickStopPropagation [
	^ self
		on: #click
		do: 'event.stopPropagation();'
]

{ #category : #events }
ELHtmlTag >> onClickUrl: anUrl [
	^ self
		on: #click
		do: 'event.stopPropagation();location.href="' , anUrl , '";'
]

{ #category : #events }
ELHtmlTag >> onClose: aBlock [
	^ self on: #close do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDoubleClick: aBlock [
	^ self on: #dblclick do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDrag: aBlock [
	^ self on: #drag do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragEnd: aBlock [
	^ self on: #dragend do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragEnter: aBlock [
	^ self on: #dragenter do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragExit: aBlock [
	^ self on: #dragexit do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragLeave: aBlock [
	^ self on: #dragleave do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragOver: aBlock [
	^ self on: #dragover do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDragStart: aBlock [
	^ self on: #dragstart do: aBlock
]

{ #category : #events }
ELHtmlTag >> onDrop: aBlock [
	^ self on: #drop do: aBlock
]

{ #category : #events }
ELHtmlTag >> onError: aBlock [
	^ self on: #error do: aBlock
]

{ #category : #events }
ELHtmlTag >> onFocus: aBlock [
	^ self on: #focus do: aBlock
]

{ #category : #events }
ELHtmlTag >> onInput: aBlock [
	^ self on: #input do: aBlock
]

{ #category : #events }
ELHtmlTag >> onInvalid: aBlock [
	^ self on: #invalid do: aBlock
]

{ #category : #events }
ELHtmlTag >> onKeyDown: aBlock [
	^ self on: #keydown do: aBlock
]

{ #category : #events }
ELHtmlTag >> onKeyPress: aBlock [
	^ self on: #keypress do: aBlock
]

{ #category : #events }
ELHtmlTag >> onKeyUp: aBlock [
	^ self on: #keyup do: aBlock
]

{ #category : #events }
ELHtmlTag >> onLoad: aBlock [
	^ self on: #load do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseDown: aBlock [
	^ self on: #mousedown do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseEnter: aBlock [
	^ self on: #mouseenter do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseLeave: aBlock [
	^ self on: #mouseleave do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseMove: aBlock [
	^ self on: #mousemove do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseOut: aBlock [
	^ self on: #mouseout do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseOver: aBlock [
	^ self on: #mouseover do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseUp: aBlock [
	^ self on: #mouseup do: aBlock
]

{ #category : #events }
ELHtmlTag >> onMouseWheel: aBlock [
	^ self on: #mousewheel do: aBlock
]

{ #category : #helpers }
ELHtmlTag >> onOffString: aBooleanOrString [
	^ (#(true 'on') includes: aBooleanOrString)
		ifTrue: [ 'on' ]
		ifFalse: [ 'off' ]
]

{ #category : #events }
ELHtmlTag >> onScroll: aBlock [
	^ self on: #scroll do: aBlock
]

{ #category : #events }
ELHtmlTag >> onSelect: aBlock [
	^ self on: #select do: aBlock
]

{ #category : #events }
ELHtmlTag >> onSubmit: aBlock [
	^ self on: #submit do: aBlock
]

{ #category : #printing }
ELHtmlTag >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: self tagName;
		nextPut: $)
]

{ #category : #rendering }
ELHtmlTag >> renderAttributeValue: aString on: aStream [
	aString renderAsAttributeValueOn: aStream
]

{ #category : #rendering }
ELHtmlTag >> renderAttributesOn: aStream [
	self renderGeneralAttributesOn: aStream.
	self renderClassAttributeOn: aStream.
	self renderStyleAttributeOn: aStream.
	self renderEventAttributesOn: aStream
]

{ #category : #rendering }
ELHtmlTag >> renderClassAttributeOn: aStream [
	classNames ifNil: [ ^ self ].
	
	aStream
		nextPutAll: ' class="';
		nextPutAll: (classNames joinUsing: Character space);
		nextPut: $"
]

{ #category : #rendering }
ELHtmlTag >> renderEventAttributesOn: aStream [
	events ifNil: [ ^ self ].
	
	events do: [ :each |
		aStream
			nextPutAll: ' on';
			nextPutAll: each key;
			nextPutAll: '="'.
		self renderAttributeValue: each value on: aStream.
		aStream nextPut: $" ]
]

{ #category : #rendering }
ELHtmlTag >> renderGeneralAttributesOn: aStream [
	attributes ifNil: [ ^ self ].
	
	(attributes associations
		reject: [ :each | #(false nil) includes: each value ])
			do: [ :assoc |
				aStream space.
				aStream nextPutAll: assoc key.
				assoc value ~= true ifTrue: [
					aStream nextPutAll: '="'.
					self renderAttributeValue: assoc value on: aStream.
					aStream nextPut: $" ] ]
]

{ #category : #rendering }
ELHtmlTag >> renderStartTagOn: aStream [
	aStream
		nextPut: $<;
		nextPutAll: self tagName.
	self renderAttributesOn: aStream.
	aStream nextPut: $>
]

{ #category : #rendering }
ELHtmlTag >> renderStyleAttributeOn: aStream [
	styles ifNil: [ ^ self ].
	
	aStream
		nextPutAll: ' style="';
		nextPutAll: self buildStyleAttribute;
		nextPut: $"
]

{ #category : #attributes }
ELHtmlTag >> spellCheck: aBoolean [
	^ self
		attributeAt: #spellcheck
		put: aBoolean
]

{ #category : #attributes }
ELHtmlTag >> style [
	^ self buildStyleAttribute
]

{ #category : #attributes }
ELHtmlTag >> styleAt: key [
	^ self styles at: key
]

{ #category : #attributes }
ELHtmlTag >> styleAt: key put: value [
	self styles at: key put: value
]

{ #category : #attributes }
ELHtmlTag >> styles [
	^ styles ifNil: [
		styles := Dictionary new ]
]

{ #category : #attributes }
ELHtmlTag >> tabIndex: anInteger [
	^ self
		attributeAt: #tabindex
		put: anInteger
]

{ #category : #accessing }
ELHtmlTag >> tagName [
	^ self subclassResponsibility
]

{ #category : #attributes }
ELHtmlTag >> title: aString [
	^ self
		attributeAt: #title
		put: aString
]

{ #category : #attributes }
ELHtmlTag >> translate: aBooleanOrString [
	^ self
		attributeAt: #translate
		put: (self yesNoString: aBooleanOrString)
]

{ #category : #helpers }
ELHtmlTag >> yesNoString: aBooleanOrString [
	^ (#(true 'yes') includes: aBooleanOrString)
		ifTrue: [ 'yes' ]
		ifFalse: [ 'no' ]
]
