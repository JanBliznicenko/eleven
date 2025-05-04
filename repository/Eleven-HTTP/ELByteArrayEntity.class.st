Class {
	#name : 'ELByteArrayEntity',
	#superclass : 'ELEntity',
	#category : 'Eleven-HTTP-Messages',
	#package : 'Eleven-HTTP',
	#tag : 'Messages'
}

{ #category : 'constants' }
ELByteArrayEntity class >> defaultContentType [
	^ ELContentType binary
]
