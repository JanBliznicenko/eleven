accessing
headersDo: aBlock
	^ headers do: [ :each | aBlock cull: each ]