request handling
internalServerErrorResponse: aText
	self flag: #todo.	"wrap a nicer HTML error page around it"
	^ ELInternalServerErrorResponse with: aText