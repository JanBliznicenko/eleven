accessing
contentType
	^ self headerAt: ELContentType headerName ifAbsent: [ self class defaultContentType value ]