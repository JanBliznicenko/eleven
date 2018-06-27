rendering
renderFor: request on: aStream
	"Outputs HTML code verbatim (no checks, no escaping)."
	aStream nextPutAll: verbatimHtml