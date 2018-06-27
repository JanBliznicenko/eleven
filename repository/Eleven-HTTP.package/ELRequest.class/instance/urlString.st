accessing - path
urlString
	^ String streamContents: [ :stream | url printOn: stream ]