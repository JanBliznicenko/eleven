accessing
handler
	^ handler ifNil: [
			handler := self buildHandler ]