*Eleven-Server-Zinc
formStateFromZnMultipartRequest: aZnRequest
	| fields |
	
	fields := ZnMultiValueDictionary new.
	
	aZnRequest entity parts
		select: [ :each | each fileName isNil ]
		thenDo: [ :each |
			fields at: each fieldName add:
				(each hasEntity
					ifTrue: [ each contents asByteArray utf8Decoded ]
					ifFalse: [ '' ]) ].
	
	^ ELFormState from: fields