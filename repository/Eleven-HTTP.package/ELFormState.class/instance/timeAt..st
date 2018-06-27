accessing fields
timeAt: key
	[ ^ ((self stringAt: (key , 'Hours') asSymbol) , ':'
		, (self stringAt: (key , 'Minutes') asSymbol)) asTime ]
		on: Error
		do: [ ^ Time midnight ]