converting
asResponseFor: request
	^ (super asResponseFor: request)
			withContentType: ELContentType htmlWithDefaultCharset