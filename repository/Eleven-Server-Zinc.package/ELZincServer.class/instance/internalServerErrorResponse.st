request handling
internalServerErrorResponse
	self flag: #todo.	"wrap a nicer HTML error page around it"
	^ ELInternalServerErrorResponse new