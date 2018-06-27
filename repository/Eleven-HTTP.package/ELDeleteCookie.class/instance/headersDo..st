accessing
headersDo: aBlock
	super headersDo: aBlock.
	aBlock value: cookie asRemovalResponseHeader