accessing
headersDo: aBlock
	decoratedResponse headersDo: [ :each |
		each name asLowercase ~= headerNameLowercase
			ifTrue: [ aBlock value: each ] ]