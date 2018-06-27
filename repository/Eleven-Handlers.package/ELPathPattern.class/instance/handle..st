request handling
handle: request
	| pathSegments attributes |
	pathSegments := request pathSegments.
	pathSegments size < patternSegments size
		ifTrue: [ ^ ELResponse none ].
	attributes := Dictionary new.
	patternSegments
		withIndexDo: [ :segment :index | 
			(segment match: (pathSegments at: index) into: attributes)
				ifFalse: [ ^ ELResponse none ] ].
	^ decoratedHandler handle: ((request withoutFirstPathSegments: patternSegments size) withAttributes: attributes)