building
buildWith: aDictionary
	^ (self buildPathWith: aDictionary) ,
		(self buildQueryStringWith: aDictionary)