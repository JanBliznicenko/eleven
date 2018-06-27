validating
ensureValidity
	self hasErrors ifTrue: [
		ELFormIsInvalid signal ]