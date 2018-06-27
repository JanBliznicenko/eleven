instance creation
with: firstObject with: secondObject with: thirdObject
	^ self with:
			(Array
				with: firstObject
				with: secondObject
				with: thirdObject)