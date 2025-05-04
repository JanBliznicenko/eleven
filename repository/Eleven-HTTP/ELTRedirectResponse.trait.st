Trait {
	#name : 'ELTRedirectResponse',
	#category : 'Eleven-HTTP-StatusCodes',
	#package : 'Eleven-HTTP',
	#tag : 'StatusCodes'
}

{ #category : 'instance creation' }
ELTRedirectResponse classSide >> url: aUrl [
	^ ELAddHeader headerName: 'Location' value: aUrl asString with:
			(ELAddHeader headerName: 'Connection' value: 'Close' with:
				self new)
]
