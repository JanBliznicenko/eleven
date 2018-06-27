accessing fields
at: key ifAbsent: aBlock
	^ fields at: key ifAbsent: aBlock