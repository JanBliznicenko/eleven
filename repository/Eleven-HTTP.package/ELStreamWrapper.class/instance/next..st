reading
next: anInteger
	| collection |
	
	collection := Array new: anInteger.
	
	1 to: anInteger do: [ :index |
		collection at: index put: self next ].
	
	^ collection