accessing field groups
groupsOf: aDictionary count: countFieldName
	"aDictionary should contain associations in the form:
		#fieldName -> [ :index | get value of fieldName at index from form ]"
	| groupFields |
	
	groupFields := aDictionary asDictionary associations.
	
	^ (1 to: (self countAt: countFieldName)) collect: [ :index |
			(groupFields collect: [ :field |
				field key -> (field value cull: index) ])
					asDictionary ]