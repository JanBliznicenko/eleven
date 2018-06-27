visiting
visitParameterValue: aParameterValue
	| present prevValue |
	
	(present := parameters includesKey: aParameterValue parameter)
		ifTrue: [
			prevValue := parameters at: aParameterValue parameter ].
	
	parameters at: aParameterValue parameter put: aParameterValue value.
	
	aParameterValue decoratedHandler accept: self.
	
	present
		ifTrue: [ parameters at: aParameterValue parameter put: prevValue ]
		ifFalse: [ parameters removeKey: aParameterValue parameter ]