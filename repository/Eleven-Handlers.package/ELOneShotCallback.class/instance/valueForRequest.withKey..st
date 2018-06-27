evaluating
valueForRequest: request withKey: key
	request session removeCallbackAt: key.
	
	^ super valueForRequest: request withKey: key