rendering
renderFor: request on: aStream
	self renderStartTagOn: aStream.
	self renderContentFor: request on: aStream.
	self renderEndTagOn: aStream