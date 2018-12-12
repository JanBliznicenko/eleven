Extension { #name : #Character }

{ #category : #'*Eleven-HTTP' }
Character >> asResponseFor: request [
	^ self asString asResponseFor: request
]
