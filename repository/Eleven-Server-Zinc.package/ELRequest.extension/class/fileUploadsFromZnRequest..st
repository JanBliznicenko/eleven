*Eleven-Server-Zinc
fileUploadsFromZnRequest: aZnRequest
	^ ((aZnRequest contentType notNil
			and: [ (aZnRequest contentType matches: ZnMimeType multiPartFormData)
				and: [ aZnRequest hasEntity ] ])
					ifTrue: [ self fileUploadsFromZnMultipartFormDataEntity: aZnRequest entity ]
					ifFalse: [ Dictionary new ])