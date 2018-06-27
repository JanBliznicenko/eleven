accessing field groups
groupsOf: aDictionary
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