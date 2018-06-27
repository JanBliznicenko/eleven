*Eleven-HTTP
asResponseFor: request
	^ (ELOkResponse with:
			(ELStreamedEntity string: self))
				withContentType: ELContentType textWithDefaultCharset