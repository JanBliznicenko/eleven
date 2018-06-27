*Eleven-Handlers
handle: request
	"For polymorphism with request handlers (ELRequestHandler hierarchy): any object may be used as a handler which always handles the request by answering a response made of self."
	^ self asResponseFor: request