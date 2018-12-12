Extension { #name : #ELApplication }

{ #category : #'*Eleven-Server-Zinc' }
ELApplication >> startDefaultOn: portNumber [
	^ self defaultServerClass startDefaultOn: portNumber with: self
]

{ #category : #'*Eleven-Server-Zinc' }
ELApplication class >> startDefaultOn: portNumber [
	^ self new startDefaultOn: portNumber
]

{ #category : #'*Eleven-Server-Zinc' }
ELApplication class >> startOn: portNumber [
	^ self new startOn: portNumber
]

{ #category : #'*Eleven-Server-Zinc' }
ELApplication >> startOn: portNumber [
	^ self defaultServerClass startOn: portNumber with: self
]
