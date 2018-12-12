Extension { #name : #ELStreamedEntity }

{ #category : #'*Eleven-Server-Zinc' }
ELStreamedEntity >> asZnEntityWithType: contentType [
	^ ZnStreamingEntity readFrom: stream usingType: contentType andLength: size
]
