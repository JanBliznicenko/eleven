writing
nextPutAll: aCollection
	aCollection do: [ :each |
		self nextPut: each ].
	
	^ aCollection