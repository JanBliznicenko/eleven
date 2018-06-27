initialization
initializeInstances
	MethodsByName :=
		({ELDeleteMethod. ELGetMethod. ELHeadMethod. ELPatchMethod. ELPostMethod. ELPutMethod}
			collect: [ :each | each instance name -> each instance ])
				asDictionary