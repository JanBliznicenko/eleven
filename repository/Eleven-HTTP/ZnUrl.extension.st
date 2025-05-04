Extension { #name : 'ZnUrl' }

{ #category : '*Eleven-HTTP' }
ZnUrl >> queryAt: key ifPresent: presentBlock ifAbsent: absentBlock [
	^ self hasQuery
		ifTrue: [ self query at: key asString ifPresent: presentBlock ifAbsent: absentBlock ]
		ifFalse: absentBlock
]
