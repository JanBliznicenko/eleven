Class {
	#name : #ELStatusResponse,
	#superclass : #ELResponseDecorator,
	#category : 'Eleven-HTTP-StatusCodes'
}

{ #category : #'named instances' }
ELStatusResponse class >> badRequest [
	^ ELBadRequestResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> forbidden [
	^ ELForbiddenResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> forbidden: decoratedResponse [
	^ ELForbiddenResponse with: decoratedResponse
]

{ #category : #'named instances' }
ELStatusResponse class >> found: aUrl [
	^ ELFoundResponse url: aUrl
]

{ #category : #'named instances' }
ELStatusResponse class >> internalServerError [
	^ ELInternalServerErrorResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> methodNotAllowed [
	^ ELMethodNotAllowedResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> movedPermanently: aUrl [
	^ ELMovedPermanentlyResponse url: aUrl
]

{ #category : #'named instances' }
ELStatusResponse class >> movedTemporarily: aUrl [
	^ ELTemporaryRedirectResponse url: aUrl
]

{ #category : #'named instances' }
ELStatusResponse class >> notFound [
	^ ELNotFoundResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> notFound: decoratedResponse [
	^ ELNotFoundResponse with: decoratedResponse
]

{ #category : #'named instances' }
ELStatusResponse class >> ok: decoratedResponse [
	^ ELOkResponse with: decoratedResponse
]

{ #category : #'named instances' }
ELStatusResponse class >> seeOther: aUrl [
	^ ELSeeOtherResponse url: aUrl
]

{ #category : #'named instances' }
ELStatusResponse class >> serviceUnavailable [
	^ ELServiceUnavailableResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> serviceUnavailable: decoratedResponse [
	^ ELServiceUnavailableResponse with: decoratedResponse
]

{ #category : #'named instances' }
ELStatusResponse class >> unauthorized [
	^ ELUnauthorizedResponse new
]

{ #category : #'named instances' }
ELStatusResponse class >> unauthorized: decoratedResponse [
	^ ELUnauthorizedResponse with: decoratedResponse
]

{ #category : #accessing }
ELStatusResponse >> entityStreamsDo: aBlock [
	super entityStreamsDo: [ :each |
		aBlock value: each.
		^ self ].
	
	"Fall back to just printing the status message if possible."
	(self statusCode = 200
		or: [ self statusCode >= 400 ]) ifTrue: [
			aBlock value: (ELStreamedEntity string: self statusMessage) ]
]

{ #category : #printing }
ELStatusResponse >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		print: self statusCode;
		space;
		nextPutAll: self statusMessage;
		nextPut: $)
]

{ #category : #accessing }
ELStatusResponse >> statusCode [
	self subclassResponsibility
]

{ #category : #accessing }
ELStatusResponse >> statusMessage [
	self subclassResponsibility
]
