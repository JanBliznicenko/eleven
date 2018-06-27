instance creation
with: firstHandler with: secondHandler with: thirdHandler
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler)