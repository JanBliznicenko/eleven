*Eleven-Server-Zinc
headersAsZnHeaders
	| znHeaders |
	
	znHeaders := ZnHeaders new.
	
	self headersDo: [ :each |
		znHeaders at: each name add: each valueWithAttributes ].
	
	^ znHeaders