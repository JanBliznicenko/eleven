instance creation
path: pathString query: queryDictionary
	^ self new
			path: pathString;
			queryString: (self buildQueryString: queryDictionary)