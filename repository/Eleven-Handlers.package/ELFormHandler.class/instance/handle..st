request handling
handle: request
	(self shouldHandle: request) ifTrue: [
		^ request formState copy
				handleBy: self in: request ].
	
	^ self handleEmptyForm: request