Extension { #name : #ELResponse }

{ #category : #'*Eleven-Server-Zinc' }
ELResponse >> asZnResponse [
	^ ZnResponse new
		statusLine: (ZnStatusLine code: self statusCode);
		headers: self headersAsZnHeaders;
		entity:
			(self entityStream
				ifNotNil:
					[ :entityStream | entityStream asZnEntityWithType: self znContentType ])
]

{ #category : #'*Eleven-Server-Zinc' }
ELResponse >> headersAsZnHeaders [
	| znHeaders |
	
	znHeaders := ZnHeaders new.
	
	self headersDo: [ :each |
		znHeaders at: each name add: each valueWithAttributes ].
	
	^ znHeaders
]

{ #category : #'*Eleven-Server-Zinc' }
ELResponse >> znContentType [
	^ ZnMimeType commonMimeTypes
		detect: [ :any | self contentType value = (any main , '/' , any sub) ]
]
