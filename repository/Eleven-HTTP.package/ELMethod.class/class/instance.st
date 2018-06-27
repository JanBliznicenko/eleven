instance creation
instance
	^ instance ifNil: [ instance := self basicNew initialize ]