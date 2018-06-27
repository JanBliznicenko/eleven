private
cookies
	^ cookies
		ifNil: [ cookies := headers
				flatCollect: [ :header | 
					header name asLowercase = ELCookie requestHeaderName asLowercase
						ifTrue: [ ELCookie fromHeader: header ]
						ifFalse: [ Array new ] ] ]