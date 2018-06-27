visiting
visitPathSegment: aPathSegment
	pathSegments addLast: aPathSegment segment.
	
	aPathSegment decoratedHandler accept: self.
	
	pathSegments removeLast