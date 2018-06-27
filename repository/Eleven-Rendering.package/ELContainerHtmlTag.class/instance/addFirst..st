accessing
addFirst: anObject
	content isCollection
		ifTrue: [ self with: {anObject} , (Array withAll: content) ]
		ifFalse: [ self with: anObject with: content ]