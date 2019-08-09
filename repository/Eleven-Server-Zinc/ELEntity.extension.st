Extension { #name : #ELEntity }

{ #category : #'*Eleven-Server-Zinc' }
ELEntity >> asZnEntityWithType: contentType [
	^ self znEntityType
		readFrom: stream
		usingType: contentType
		andLength: size
]

{ #category : #'*Eleven-Server-Zinc' }
ELEntity >> znEntityType [
	^ self subclassResponsibility
]
