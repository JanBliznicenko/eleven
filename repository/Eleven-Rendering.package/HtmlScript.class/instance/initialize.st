initialization
initialize
	super initialize.
	self type: self class javaScriptType.
	content := ''