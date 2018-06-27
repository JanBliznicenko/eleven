accessing field groups
groupOf: aCollection
	| group |
	
	group := OrderedDictionary new.
	
	aCollection do: [ :fieldName |
		self at: fieldName withIndexDo: [ :value :index |
			(group at: index ifAbsentPut: [ Dictionary new ])
				at: fieldName put: value ] ].
	
	^ group