instance creation
with: firstHandler with: secondHandler
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler)