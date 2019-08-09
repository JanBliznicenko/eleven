Class {
	#name : #ELByteArrayEntity,
	#superclass : #ELEntity,
	#category : #'Eleven-HTTP-Messages'
}

{ #category : #constants }
ELByteArrayEntity class >> defaultContentType [
	^ ELContentType binary
]
