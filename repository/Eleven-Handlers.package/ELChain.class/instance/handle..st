request handling
handle: request
	elements do: [ :each |
		(each handle: request)
			responsesFor: request do: [ :response |
				^ response ] ].
	
	^ ELResponse none