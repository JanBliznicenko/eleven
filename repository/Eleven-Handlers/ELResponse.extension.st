Extension { #name : #ELResponse }

{ #category : #'*Eleven-Handlers' }
ELResponse >> handle: request [
	"For polymorphism with request handlers (ELRequestHandler hierarchy): a response is also a valid handler and will always handle the request by answering self."
	^ self
]

{ #category : #'*Eleven-Handlers' }
ELResponse >> responsesFor: request do: aBlock [
	aBlock value: self
]
