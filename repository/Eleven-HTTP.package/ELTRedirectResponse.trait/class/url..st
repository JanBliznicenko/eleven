instance creation
url: aUrl
	^ ELAddHeader headerName: 'Location' value: aUrl asString with:
			(ELAddHeader headerName: 'Connection' value: 'Close' with:
				self new)