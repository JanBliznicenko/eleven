accessing
add: anObject
	content isCollection
		ifTrue: [ self with: (Array withAll: content , {anObject}) ]
		ifFalse: [ self with: content with: anObject ]