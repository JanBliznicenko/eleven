request handling
handleException: anException inRequest: aZnRequest
	^ [ applicationHandler
		handleException: anException
		inRequest: (ELRequest fromZnRequest: aZnRequest) ]
		on: Exception
		do: [ :ex | 
			self isDebugMode
				ifTrue: [ ex debug ]
				ifFalse: [ Smalltalk logError: ex messageText inContext: ex signalerContext ].
			^ self
				internalServerErrorResponse:
					(ELStreamedEntity
						string:
							'Technická chyba - Kontaktujte nás na našem portálu pro kontakt a podporu a opište nebo zkopírujte následující text chyby: '
								, ex messageText) ]