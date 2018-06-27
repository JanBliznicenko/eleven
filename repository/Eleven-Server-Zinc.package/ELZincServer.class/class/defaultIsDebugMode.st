debug mode
defaultIsDebugMode
	^ defaultIsDebugMode ifNil: [
			defaultIsDebugMode := false ]