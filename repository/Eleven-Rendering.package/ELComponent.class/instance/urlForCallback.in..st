callbacks
urlForCallback: aCallback in: aSession
	^ self urlForCallbackNamed:
			(aCallback registerIn: aSession)