accessing
registerCallback: aCallback
	| key |
	
	self callbackSemaphore critical: [
		[
			key := UUID new asString36
		] doWhileTrue: [
			callbacks includesKey: key ].
		callbacks at: key put: aCallback ].
	
	^ key