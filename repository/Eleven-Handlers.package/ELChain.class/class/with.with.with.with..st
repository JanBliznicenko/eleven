instance creation
with: firstHandler with: secondHandler with: thirdHandler with: fourthHandler
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler
				with: fourthHandler)