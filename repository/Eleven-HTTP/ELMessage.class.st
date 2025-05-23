Class {
	#name : 'ELMessage',
	#superclass : 'Object',
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'accessing' }
ELMessage >> contentType [
	^ self headerAt: ELContentType headerName
]

{ #category : 'accessing' }
ELMessage >> headerAt: aString [
	^ self headerAt: aString ifAbsent: [ nil ]
]

{ #category : 'accessing' }
ELMessage >> headerAt: aString ifAbsent: aBlock [
	self
		headersDo: [ :header | 
			header name = aString
				ifTrue: [ ^ header valueWithAttributes ] ].
	^ aBlock value
]

{ #category : 'accessing' }
ELMessage >> headersDo: aBlock [
	self subclassResponsibility
]
