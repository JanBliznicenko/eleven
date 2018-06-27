*Eleven-Server-Zinc
formStateFromZnRequest: aZnRequest
	"Note that the request might not have a Content-Type header and even if it has one, it might not have an entity."
	aZnRequest contentType ifNil: [
		^ ELFormState from: Dictionary new ].
	
	((aZnRequest contentType matches: ZnMimeType applicationFormUrlEncoded)
		and: [ aZnRequest hasEntity ])
			ifTrue: [
				^ ELFormState from: aZnRequest entity fields ].
	
	((aZnRequest contentType matches: ZnMimeType multiPartFormData)
		and: [ aZnRequest hasEntity ])
			ifTrue: [
				^ self formStateFromZnMultipartRequest: aZnRequest ].
	
	^ ELFormState from: Dictionary new