transforming
withoutFirstPathSegments: aNumber
	^ self copy pathSegments: (self pathSegments allButFirst: aNumber)