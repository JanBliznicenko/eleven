Extension { #name : #ELRequest }

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> fileUploadsFromZnMultipartFormDataEntity: aZnEntity [
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
]

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> fileUploadsFromZnRequest: aZnRequest [
	^ ((aZnRequest contentType notNil
			and: [ (aZnRequest contentType matches: ZnMimeType multiPartFormData)
				and: [ aZnRequest hasEntity ] ])
					ifTrue: [ self fileUploadsFromZnMultipartFormDataEntity: aZnRequest entity ]
					ifFalse: [ Dictionary new ])
]

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> formStateFromZnMultipartRequest: aZnRequest [
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
]

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> formStateFromZnRequest: aZnRequest [
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
]

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> fromZnRequest: aZnRequest [
	^ self new
		originalRequest: aZnRequest;
		method: (ELMethod named: aZnRequest method);
		url: aZnRequest url;
		version: aZnRequest requestLine version;
		headers: (self headersFromZnRequest: aZnRequest);
		entity: aZnRequest entity;
		formState: (self formStateFromZnRequest: aZnRequest);
		fileUploads: (self fileUploadsFromZnRequest: aZnRequest)
]

{ #category : #'*Eleven-Server-Zinc' }
ELRequest class >> headersFromZnRequest: aZnRequest [
	^ Array
		streamContents: [ :headerStream | 
			aZnRequest
				headersDo: [ :headerName :headerValue | 
					(headerName asLowercase ~= 'user-agent' and: [ headerValue includes: $, ])
						ifTrue: [ (headerValue substrings: ',')
								do: [ :eachValue | headerStream nextPut: (ELHeader name: headerName value: eachValue) ] ]
						ifFalse: [ headerStream nextPut: (ELHeader name: headerName value: headerValue) ] ] ]
]
