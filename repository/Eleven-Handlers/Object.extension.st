Extension { #name : #Object }

{ #category : #'*Eleven-Handlers' }
Object >> handle: request [
	"For polymorphism with request handlers (ELRequestHandler hierarchy): any object may be used as a handler which always handles the request by answering a response made of self."
	^ self asResponseFor: request
]

{ #category : #'*Eleven-Handlers' }
Object >> responsesFor: request do: aBlock [
	"For polymorphism with responses (ELResponse hierarchy): any object may be used as a response."
	aBlock value: (self asResponseFor: request)
]
