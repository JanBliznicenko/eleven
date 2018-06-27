accessing
headerAt: aString ifAbsent: aBlock
	self
		headersDo: [ :header | 
			header name asLowercase = aString
				ifTrue: [ ^ header value ] ].
	^ aBlock value