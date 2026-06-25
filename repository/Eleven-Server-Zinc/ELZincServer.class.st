Class {
	#name : 'ELZincServer',
	#superclass : 'Object',
	#instVars : [
		'zincServer',
		'portNumber',
		'applicationHandler',
		'isDebugMode'
	],
	#classVars : [
		'Default'
	],
	#classInstVars : [
		'defaultIsDebugMode'
	],
	#category : 'Eleven-Server-Zinc',
	#package : 'Eleven-Server-Zinc'
}

{ #category : 'default server' }
ELZincServer class >> default [
	^ Default
]

{ #category : 'debug mode' }
ELZincServer class >> defaultIsDebugMode [
	^ defaultIsDebugMode ifNil: [
			defaultIsDebugMode := false ]
]

{ #category : 'debug mode' }
ELZincServer class >> defaultIsDebugMode: aBoolean [
	defaultIsDebugMode := aBoolean
]

{ #category : 'default server' }
ELZincServer class >> defaultOn: portNumber with: applicationHandler [
	self stopDefault.
	^ Default := self on: portNumber with: applicationHandler
]

{ #category : 'instance creation' }
ELZincServer class >> on: portNumber with: applicationHandler [
	^ self new
			portNumber: portNumber;
			applicationHandler: applicationHandler
]

{ #category : 'default server' }
ELZincServer class >> resetDefault [
	self stopDefault.
	Default := nil
]

{ #category : 'default server' }
ELZincServer class >> startDefaultOn: portNumber with: applicationHandler [
	^ (self defaultOn: portNumber with: applicationHandler) startServer
]

{ #category : 'instance creation' }
ELZincServer class >> startOn: portNumber with: applicationHandler [
	^ (self on: portNumber with: applicationHandler) startServer
]

{ #category : 'default server' }
ELZincServer class >> stopDefault [
	Default ifNotNil: [ Default stopServer ]
]

{ #category : 'private' }
ELZincServer >> applicationHandler: aHandler [
	applicationHandler := aHandler
]

{ #category : 'constants' }
ELZincServer >> defaultPortNumber [
	^ 8080
]

{ #category : 'constants' }
ELZincServer >> defaultServerClass [
	^ ELManagingMultiThreadedServer
]

{ #category : 'request handling' }
ELZincServer >> handleException: anException inRequest: aZnRequest [
	^ [ applicationHandler
		handleException: anException
		inRequest: (ELRequest fromZnRequest: aZnRequest) ]
		on: Exception
		do: [ :ex | 
			self isDebugMode
				ifTrue: [ ex debug ]
				ifFalse: [ Smalltalk logError: ex messageText inContext: ex signalerContext ].
			^ self
				internalServerErrorResponse: (ELStreamedEntity string: self technicalErrorText , ' ' , ex messageText) ]
]

{ #category : 'request handling' }
ELZincServer >> handleRequest: aZnRequest [
	^ ([ applicationHandler handle: (ELRequest fromZnRequest: aZnRequest) ]
		on: Exception
		do: [ :ex | self handleException: ex inRequest: aZnRequest ]) asZnResponse
]

{ #category : 'initialization' }
ELZincServer >> initialize [
	super initialize.
	isDebugMode := self class defaultIsDebugMode
]

{ #category : 'request handling' }
ELZincServer >> internalServerErrorResponse [
	self flag: #todo.	"wrap a nicer HTML error page around it"
	^ ELInternalServerErrorResponse new
]

{ #category : 'request handling' }
ELZincServer >> internalServerErrorResponse: aText [
	self flag: #todo.	"wrap a nicer HTML error page around it"
	^ ELInternalServerErrorResponse with: aText
]

{ #category : 'testing' }
ELZincServer >> isDebugMode [
	^ isDebugMode
]

{ #category : 'accessing' }
ELZincServer >> portNumber [
	^ portNumber ifNil: [ self defaultPortNumber ]
]

{ #category : 'private' }
ELZincServer >> portNumber: anInteger [
	portNumber := anInteger
]

{ #category : 'printing' }
ELZincServer >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		print: applicationHandler;
		nextPutAll: ' at ';
		nextPutAll: portNumber asString;
		nextPut: $)
]

{ #category : 'actions' }
ELZincServer >> startServer [
	zincServer ifNil: [
		zincServer := self defaultServerClass on: self portNumber.
		zincServer delegate: self ].
	
	zincServer start
]

{ #category : 'actions' }
ELZincServer >> stopServer [
	zincServer ifNotNil: [
		zincServer stopServer ]
]

{ #category : 'request handling' }
ELZincServer >> technicalErrorText [
	^ 'Technická chyba:'
]
