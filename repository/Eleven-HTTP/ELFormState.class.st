Class {
	#name : #ELFormState,
	#superclass : #Object,
	#instVars : [
		'fields',
		'errors'
	],
	#category : #'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELFormState class >> basicFrom: aDictionary [
	^ self new
			fields: aDictionary
]

{ #category : #'instance creation' }
ELFormState class >> from: aDictionary [
	^ self basicFrom: (self normalize: aDictionary)
]

{ #category : #'instance creation' }
ELFormState class >> fromState: aFormState [
	^ self new
			fields: aFormState fields copy;
			errors: aFormState errors copy
]

{ #category : #private }
ELFormState class >> normalize: aDictionary [
	"
	1) Remove trailing '[]' from collections of multiple fields (which were converted to a collection by ZnMultiValueDictionary):
		original:   first[] -> #(12 34 56)
		normalized: first -> #(12 34 56)
	
	2) Transform indexed fields into collections. The indexes will not be preserved, they will be condensed:
		original:   second[1] -> 12. second[2] -> 34. second[4] -> 56
		normalized: second -> #(12 34 56)
			(*not*: second -> #(12 34 nil 56))
	
	If keys 'first' or 'second' (without '[]') already exist in the original dictionary, then the behavior is undefined (the first value to be enumerated will be overwritten). Forms should never combine 'key', 'key[]' and/or 'key[1]'.
	"
	| normalized condensed |
	
	normalized := Dictionary new.
	condensed := Dictionary new.
	
	aDictionary keysDo: [ :key |
		| value |
		value := aDictionary at: key.
		
		(key last = $] and: [ key size > 2 ])
			ifTrue: [
				key nextToLast = $[
					ifTrue: [
						normalized at: (key allButLast: 2) put: value ]
					ifFalse: [
						| index bracketPosition |
						bracketPosition := key lastIndexOf: $[.
						index := (key copyFrom: (bracketPosition max: 1) to: key size - 1) asInteger.
						(bracketPosition ~= 0 and: [ index notNil ])
							ifTrue: [
								(condensed
									at: (key first: bracketPosition - 1)
									ifAbsentPut: [ OrderedCollection new ])
										add: index -> value ]
							ifFalse: [ normalized at: key put: value ] ] ]
			ifFalse: [ normalized at: key put: value ] ].
	
	condensed keysAndValuesDo: [ :key :values |
		normalized at: key put:
			((values sorted: [ :a :b | a key < b key ])
					asArray collect: [ :each | each value ]) ].
	
	^ normalized
]

{ #category : #'accessing fields' }
ELFormState >> at: key [
	^ fields at: key
]

{ #category : #'accessing fields' }
ELFormState >> at: key collect: aBlock [
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value collect: aBlock ]
					ifFalse: [ Array with: (aBlock value: value) ] ]
			ifAbsent: [ #() ]
]

{ #category : #'accessing fields' }
ELFormState >> at: key do: aBlock [
	fields at: key ifPresent: [ :value |
		value isArray
			ifTrue: [ value do: aBlock ]
			ifFalse: [ aBlock value: value ] ]
]

{ #category : #'accessing fields' }
ELFormState >> at: key ifAbsent: aBlock [
	^ fields at: key ifAbsent: aBlock
]

{ #category : #'accessing fields' }
ELFormState >> at: key ifPresent: aBlock [
	^ fields at: key ifPresent: aBlock
]

{ #category : #'accessing fields' }
ELFormState >> at: key ifPresent: presentBlock ifAbsent: absentBlock [
	^ fields at: key ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : #'accessing fields' }
ELFormState >> at: key index: indexInteger ifAbsent: aBlock [
	^ self at: key index: indexInteger ifPresent: [ :value | value ] ifAbsent: aBlock
]

{ #category : #'accessing fields' }
ELFormState >> at: key index: indexInteger ifPresent: presentBlock ifAbsent: absentBlock [
	fields at: key ifPresent: [ :field |
		(field isArray and: [ field size >= indexInteger ])
			ifTrue: [ ^ presentBlock value: (field at: indexInteger) ]
			ifFalse: [
				indexInteger = 1 ifTrue: [ ^ presentBlock value: field ] ] ].
	
	^ absentBlock value
]

{ #category : #'accessing fields' }
ELFormState >> at: key withIndexCollect: aBlock [
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value withIndexCollect: aBlock ]
					ifFalse: [ Array with: (aBlock value: value value: 1) ] ]
			ifAbsent: [ #() ]
]

{ #category : #'accessing fields' }
ELFormState >> at: key withIndexDo: aBlock [
	fields at: key ifPresent: [ :value |
		value isArray
			ifTrue: [ value withIndexDo: aBlock ]
			ifFalse: [ aBlock value: value value: 1 ] ]
]

{ #category : #'accessing fields' }
ELFormState >> booleanAt: key [
	^ fields
		at: key
		ifPresent: [ :value | 
			value isString
				ifTrue: [ value = 'on' or: [ value = '1' ] ]
				ifFalse: [ value isNotNil and: [ value asBoolean ] ] ]
		ifAbsent: [ false ]
]

{ #category : #'accessing fields' }
ELFormState >> booleanAt: key includes: valueString [
	self
		at: key
		do: [ :each | 
			each asString = valueString
				ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #'accessing fields' }
ELFormState >> booleanAt: key index: indexInteger [
	^ self at: key index: indexInteger ifPresent: [ :value | value ~~ false ] ifAbsent: [ false ]
]

{ #category : #'accessing fields' }
ELFormState >> contains: key [
	^ fields includesKey: key
]

{ #category : #copying }
ELFormState >> copyWith: aDictionary [
	| newState |
	
	newState := self copy.
	
	aDictionary keysAndValuesDo: [ :key :value |
		newState fields at: key put: value ].
	
	^ newState
]

{ #category : #'accessing fields' }
ELFormState >> countAt: key [
	^ fields at: key
			ifPresent: [ :value |
				value isArray
					ifTrue: [ value size ]
					ifFalse: [ 1 ] ]
			ifAbsent: [ 0 ]
]

{ #category : #'accessing fields' }
ELFormState >> dateAt: key [
	| space string |
	space := Character space.
	string := self stringAt: key.
	string := string reject: [ :each | each = space ].
	^ [ Date readFrom: string readStream pattern: 'd.m.yyyy' ]
		on: Error
		do: [ nil ]
]

{ #category : #'accessing fields' }
ELFormState >> dateAt: key index: anInteger [
	| space string |
	space := Character space.
	string := self stringAt: key index: anInteger.
	string := string reject: [ :each | each = space ].
	^ [ Date readFrom: string readStream pattern: 'd.m.yyyy' ]
		on: Error
		do: [ nil ]
]

{ #category : #validating }
ELFormState >> ensureValidity [
	self hasErrors ifTrue: [
		ELFormIsInvalid signal ]
]

{ #category : #'accessing errors' }
ELFormState >> errors [
	^ errors
]

{ #category : #private }
ELFormState >> errors: anObject [
	errors := anObject
]

{ #category : #'accessing errors' }
ELFormState >> errorsAt: nameSymbol [
	| value |
	
	value := errors at: nameSymbol ifAbsent: [ #() ].
	
	^ value isArray
			ifTrue: [ value ]
			ifFalse: [ Array with: value ]
]

{ #category : #'accessing fields' }
ELFormState >> fields [
	^ fields
]

{ #category : #private }
ELFormState >> fields: anObject [
	fields := anObject
]

{ #category : #'accessing field groups' }
ELFormState >> groupOf: aCollection [
	| group |
	
	group := OrderedDictionary new.
	
	aCollection do: [ :fieldName |
		self at: fieldName withIndexDo: [ :value :index |
			(group at: index ifAbsentPut: [ Dictionary new ])
				at: fieldName put: value ] ].
	
	^ group
]

{ #category : #'accessing field groups' }
ELFormState >> groupsOf: aDictionary [
	"aDictionary should contain associations in the form #groupName -> #(fieldName1 fieldName2)"
	| remainingFields groupedFields |
	
	remainingFields := fields copy.
	groupedFields := Dictionary new.
	
	aDictionary keysAndValuesDo: [ :groupName :fieldNames |
		fieldNames do: [ :each |
			remainingFields removeKey: each ].
		groupedFields
			at: groupName
			put: (self groupOf: fieldNames) ].
	
	"Add the rest of the fields (that are not present in any group. Don't overwrite a group if the names collide."
	remainingFields keysAndValuesDo: [ :key :value |
		groupedFields at: key ifAbsentPut: [ value ] ].
	
	^ groupedFields
]

{ #category : #'accessing field groups' }
ELFormState >> groupsOf: aDictionary collect: aBlock count: countFieldName [
	^ (self groupsOf: aDictionary count: countFieldName)
			collect: aBlock
]

{ #category : #'accessing field groups' }
ELFormState >> groupsOf: aDictionary count: countFieldName [
	"aDictionary should contain associations in the form:
		#fieldName -> [ :index | get value of fieldName at index from form ]"
	| groupFields |
	
	groupFields := aDictionary asDictionary associations.
	
	^ (1 to: (self countAt: countFieldName)) collect: [ :index |
			(groupFields collect: [ :field |
				field key -> (field value cull: index) ])
					asDictionary ]
]

{ #category : #'accessing field groups' }
ELFormState >> groupsOf: aDictionary reject: rejectBlock collect: collectBlock count: countFieldName [
	^ (self groupsOf: aDictionary count: countFieldName)
			reject: rejectBlock thenCollect: collectBlock
]

{ #category : #'accessing field groups' }
ELFormState >> groupsOf: aDictionary reject: aBlock count: countFieldName [
	^ (self groupsOf: aDictionary count: countFieldName)
			reject: aBlock
]

{ #category : #'accessing errors' }
ELFormState >> hasErrors [
	^ errors notEmpty
]

{ #category : #'accessing errors' }
ELFormState >> hasErrors: nameSymbol [
	^ (self errorsAt: nameSymbol) notEmpty
]

{ #category : #initialization }
ELFormState >> initialize [
	super initialize.
	
	fields := Dictionary new.
	errors := ZnMultiValueDictionary new
]

{ #category : #'accessing fields' }
ELFormState >> integerAt: key [
	^ self integerAt: key default: 0
]

{ #category : #'accessing fields' }
ELFormState >> integerAt: key default: anInteger [
	^ (self integerOrNilAt: key) ifNil: [ anInteger ]
]

{ #category : #'accessing fields' }
ELFormState >> integerAt: key index: indexInteger [
	^ self integerAt: key index: indexInteger default: 0
]

{ #category : #'accessing fields' }
ELFormState >> integerAt: key index: indexInteger default: anInteger [
	^ (self integerOrNilAt: key index: indexInteger) ifNil: [ anInteger ]
]

{ #category : #'accessing fields' }
ELFormState >> integerOrNilAt: key [
	^ ((self stringAt: key) reject: [ :each | each isSeparator ]) asInteger
]

{ #category : #'accessing fields' }
ELFormState >> integerOrNilAt: key index: indexInteger [
	^ (self stringAt: key index: indexInteger) asInteger
]

{ #category : #'accessing fields' }
ELFormState >> integersAt: key [

	^ (self at: key ifAbsent: Array new) collect: [ :each | 
		  each asInteger ]
]

{ #category : #'accessing fields' }
ELFormState >> radiobuttonBooleanOrFalseAt: key [
	^ self radiobuttonBooleanValues at: (self stringAt: key) ifPresent: [ :value | value = true ] ifAbsent: [ false ]
]

{ #category : #'accessing fields' }
ELFormState >> radiobuttonBooleanOrFalseAt: key index: indexInteger [
	^ self radiobuttonBooleanValues at: (self stringAt: key index: indexInteger) ifPresent: [ :value | value = true ] ifAbsent: [ false ]
]

{ #category : #'accessing fields' }
ELFormState >> radiobuttonBooleanOrNilAt: key [
	^ self radiobuttonBooleanValues at: (self stringAt: key) ifAbsent: [ nil ]
]

{ #category : #'accessing fields' }
ELFormState >> radiobuttonBooleanOrNilAt: key index: indexInteger [
	^ self radiobuttonBooleanValues at: (self stringAt: key index: indexInteger) ifAbsent: [ nil ]
]

{ #category : #constants }
ELFormState >> radiobuttonBooleanValues [
	^ {
			'1' -> true.
			'0' -> false.
			'' -> nil
		} asDictionary
]

{ #category : #copying }
ELFormState >> shallowCopy [
	^ self class fromState: self
]

{ #category : #'accessing fields' }
ELFormState >> stringAt: key [
	| value |
	value := (self at: key ifAbsent: [ '' ]) ifNil: [ '' ].
	^ ((value = true or: [ value = false ])
		ifTrue: [ value asBit ]
		ifFalse: [ value ]) asString trimmed
]

{ #category : #'accessing fields' }
ELFormState >> stringAt: key index: indexInteger [
	^ ((self at: key index: indexInteger ifAbsent: [ '' ]) ifNil: [ '' ]) asString trimmed
]

{ #category : #'accessing fields' }
ELFormState >> stringsAt: key [

	^ (self at: key ifAbsent: Array new) collect: [ :each | 
		  each asString ]
]

{ #category : #'accessing fields' }
ELFormState >> timeAt: key [
	[ ^ ((self stringAt: (key , 'Hours') asSymbol) , ':'
		, (self stringAt: (key , 'Minutes') asSymbol)) asTime ]
		on: Error
		do: [ ^ Time midnight ]
]

{ #category : #validating }
ELFormState >> validate: fieldName sameAs: otherFieldName message: aString [
	(self stringAt: fieldName) = (self stringAt: otherFieldName) ifFalse: [
		self validationError: aString for: fieldName ]
]

{ #category : #validating }
ELFormState >> validateChecked: fieldName message: aString [
	(self booleanAt: fieldName) ifFalse: [
		self validationError: aString for: fieldName ]
]

{ #category : #validating }
ELFormState >> validateFilled: fieldName message: aString [
	(self stringAt: fieldName) ifEmpty: [
		self validationError: aString for: fieldName ]
]

{ #category : #validating }
ELFormState >> validationError: aString for: key [
	ELValidationFailed new
		key: key;
		messageText: aString;
		signal
]
