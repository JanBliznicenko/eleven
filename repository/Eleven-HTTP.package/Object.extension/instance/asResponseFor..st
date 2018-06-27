*Eleven-HTTP
asResponseFor: request
	^ ELOkResponse with:
			(self asStreamedEntityFor: request)