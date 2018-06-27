*Eleven-Server-Zinc
headersFromZnRequest: aZnRequest
	^ Array
		streamContents: [ :headerStream | 
			aZnRequest
				headersDo: [ :headerName :headerValue | 
					(headerName asLowercase ~= 'user-agent' and: [ headerValue includes: $, ])
						ifTrue: [ (headerValue substrings: ',')
								do: [ :eachValue | headerStream nextPut: (ELHeader name: headerName value: eachValue) ] ]
						ifFalse: [ headerStream nextPut: (ELHeader name: headerName value: headerValue) ] ] ]