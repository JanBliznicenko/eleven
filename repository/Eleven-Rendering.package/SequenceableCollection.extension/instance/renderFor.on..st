*Eleven-Rendering
renderFor: request on: aStream
	self do: [ :each |
		each renderFor: request on: aStream ]