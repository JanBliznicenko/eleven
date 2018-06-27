private
normalize: aDictionary
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