accessing field groups
groupsOf: aDictionary reject: rejectBlock collect: collectBlock count: countFieldName
	^ (self groupsOf: aDictionary count: countFieldName)
			reject: rejectBlock thenCollect: collectBlock