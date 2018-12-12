Extension { #name : #String }

{ #category : #'*Eleven-HTTP' }
String >> asResponseFor: request [
	^ (ELOkResponse with:
			(ELStreamedEntity string: self))
				withContentType: ELContentType textWithDefaultCharset
]
