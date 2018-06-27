*Eleven-Handlers
responsesFor: request do: aBlock
	"For polymorphism with responses (ELResponse hierarchy): any object may be used as a response."
	aBlock value: (self asResponseFor: request)