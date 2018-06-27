accessing - path
hasPathSegments
	^ remainingPathSegments notEmpty and: [ remainingPathSegments first ~~ #/ ]