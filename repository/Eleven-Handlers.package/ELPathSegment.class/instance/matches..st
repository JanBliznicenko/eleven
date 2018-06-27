request handling
matches: request
	^ request hasPathSegments and: [ matcher matches: request firstPathSegment ]