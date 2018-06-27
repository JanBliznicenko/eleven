instance creation
with: firstHandler with: secondHandler with: thirdHandler with: fourthHandler with: fifthHandler
	^ self withAll:
			(Array
				with: firstHandler
				with: secondHandler
				with: thirdHandler
				with: fourthHandler
				with: fifthHandler)