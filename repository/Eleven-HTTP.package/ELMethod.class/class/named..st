accessing
named: aString
	MethodsByName ifNil: [ self initializeInstances ].
	
	^ MethodsByName at: aString