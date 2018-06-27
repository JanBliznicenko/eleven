*Eleven-Server-Zinc
fileUploadsFromZnMultipartFormDataEntity: aZnEntity
	| uploads |
	
	uploads := ZnMultiValueDictionary new.
	
	aZnEntity parts
		select: [ :each |
			each fileName notNil and: [ each hasEntity ] ]
		thenDo: [ :each |
			| fileUpload |
			fileUpload := ELFileUpload fromZnMimePart: each.
			uploads at: fileUpload name add: fileUpload ].
	
	^ ELFormState normalize: uploads