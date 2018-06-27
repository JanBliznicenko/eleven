accessing field groups
groupsOf: aDictionary collect: aBlock count: countFieldName
	^ (self groupsOf: aDictionary count: countFieldName)
			collect: aBlock