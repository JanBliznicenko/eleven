request handling
handleRequest: aZnRequest
	(DWLocalPhoto handles: aZnRequest)
		ifTrue: [ ^ DWLocalPhoto responseFor: aZnRequest ].
	(DWLocalProfilePhoto handles: aZnRequest)
		ifTrue: [ ^ DWLocalProfilePhoto responseFor: aZnRequest ].
	[ ^ (applicationHandler handle: (ELRequest fromZnRequest: aZnRequest)) asZnResponse ]
		on: Exception
		do: [ :ex | ^ (self handleException: ex inRequest: aZnRequest) asZnResponse ]