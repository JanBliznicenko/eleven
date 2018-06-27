accessing field groups
groupsOf: aDictionary reject: aBlock count: countFieldName
	^ (self groupsOf: aDictionary count: countFieldName)
			reject: aBlock