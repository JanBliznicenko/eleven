rendering
renderAttributesOn: aStream
	self renderGeneralAttributesOn: aStream.
	self renderClassAttributeOn: aStream.
	self renderStyleAttributeOn: aStream.
	self renderEventAttributesOn: aStream