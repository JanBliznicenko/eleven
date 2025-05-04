Class {
	#name : 'ELHeader',
	#superclass : 'Object',
	#instVars : [
		'name',
		'value',
		'attributes'
	],
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'private' }
ELHeader class >> attributeAssociationFrom: aString [
	| equalSignPosition |
	equalSignPosition := aString indexOf: $= ifAbsent: [ ^ aString trimmed -> true ].
	
	^ (aString first: equalSignPosition - 1) trimmed
			-> (self unquote: (aString allButFirst: equalSignPosition) trimmed)
]

{ #category : 'instance creation' }
ELHeader class >> name: nameString value: valueString [
	((valueString includes: $;)
		and: [ nameString asLowercase ~= 'cookie' and: [ nameString asLowercase ~= 'user-agent' ] ])
		ifTrue: [ ^ self name: nameString trimmed valueWithAttributes: valueString trimmed ].
	^ self name: nameString trimmed value: valueString trimmed attributes: Dictionary new
]

{ #category : 'instance creation' }
ELHeader class >> name: nameString value: valueString attributes: aDictionary [
	^ self new
			name: nameString value: valueString attributes: aDictionary
]

{ #category : 'instance creation' }
ELHeader class >> name: nameString valueWithAttributes: valueString [
	| parts |
	
	parts := valueString substrings: #($;).
	
	^ self
			name: nameString
			value: parts first
			attributes:
				(parts allButFirst collect: [ :each |
					self attributeAssociationFrom: each ])
						asDictionary
]

{ #category : 'private' }
ELHeader class >> unquote: aString [
	^ aString first = $"
			ifTrue: [ aString allButFirst allButLast ]
			ifFalse: [ aString ]
]

{ #category : 'accessing' }
ELHeader >> attributeAt: key [
	^ attributes at: key
]

{ #category : 'accessing' }
ELHeader >> attributeAt: key ifAbsent: aBlock [
	^ attributes at: key ifAbsent: aBlock
]

{ #category : 'accessing' }
ELHeader >> attributeAt: key ifPresent: aBlock [
	^ attributes at: key ifPresent: aBlock
]

{ #category : 'accessing' }
ELHeader >> attributeAt: key ifPresent: presentBlock ifAbsent: absentBlock [
	^ attributes at: key ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'accessing' }
ELHeader >> attributes [
	^ attributes
]

{ #category : 'accessing' }
ELHeader >> name [
	^ name
]

{ #category : 'private' }
ELHeader >> name: nameString value: valueString attributes: aDictionary [
	name := nameString asSymbol.
	value := valueString.
	attributes := aDictionary
]

{ #category : 'printing' }
ELHeader >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	self writeTo: aStream.
	aStream nextPut: $)
]

{ #category : 'accessing' }
ELHeader >> value [
	^ value
]

{ #category : 'accessing' }
ELHeader >> valueWithAttributes [
	^ attributes
			ifEmpty: [ value ]
			ifNotEmpty: [
				String streamContents: [ :attrStream |
					attrStream nextPutAll: value.
					self writeAttributesTo: attrStream ] ]
]

{ #category : 'printing' }
ELHeader >> writeAttributesTo: aStream [
	attributes associationsDo: [ :association |
		aStream nextPutAll: ';'.
		association printAsHeaderAttributeOn: aStream ]
]

{ #category : 'printing' }
ELHeader >> writeTo: aStream [
	aStream
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: value.
	
	self writeAttributesTo: aStream
]

{ #category : 'printing' }
ELHeader >> writeWithCrlfTo: aStream [
	self writeTo: aStream.
	aStream nextPutAll: String crlf
]
