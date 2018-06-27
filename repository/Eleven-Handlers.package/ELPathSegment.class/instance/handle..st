request handling
handle: request
	^ (self matches: request)
			ifTrue: [
				decoratedHandler handle: request withoutFirstPathSegment ]
			ifFalse: [
				ELResponse none ]