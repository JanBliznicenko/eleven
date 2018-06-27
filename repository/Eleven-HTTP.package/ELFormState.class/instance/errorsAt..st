accessing errors
errorsAt: nameSymbol
	| value |
	
	value := errors at: nameSymbol ifAbsent: [ #() ].
	
	^ value isArray
			ifTrue: [ value ]
			ifFalse: [ Array with: value ]