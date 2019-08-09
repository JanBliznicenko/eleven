Class {
	#name : #ELContentType,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'named values' }
ELContentType class >> binary [
	^ self value: 'application/octet-stream'
]

{ #category : #'named values' }
ELContentType class >> css [
	^ self value: 'text/css'
]

{ #category : #'character sets' }
ELContentType class >> defaultCharset [
	^ self utf8Charset
]

{ #category : #constants }
ELContentType class >> headerName [
	^ 'Content-Type'
]

{ #category : #'named values' }
ELContentType class >> html [
	^ self value: self htmlType
]

{ #category : #types }
ELContentType class >> htmlType [
	^ 'text/html'
]

{ #category : #'named values' }
ELContentType class >> htmlWithCharset: aString [
	^ self value: self htmlType withCharset: aString
]

{ #category : #'named values' }
ELContentType class >> htmlWithDefaultCharset [
	^ self valueWithDefaultCharset: self htmlType
]

{ #category : #'named values' }
ELContentType class >> htmlWithUtf8Charset [
	^ self value: self htmlType withCharset: self utf8Charset
]

{ #category : #'named values' }
ELContentType class >> javaScript [
	^ self value: 'text/javascript'
]

{ #category : #'named values' }
ELContentType class >> json [
	^ self value: 'application/json'
]

{ #category : #'named values' }
ELContentType class >> multipartForm [
	^ self value: 'multipart/form-data'
]

{ #category : #'named values' }
ELContentType class >> pdf [
	^ self value: 'application/pdf'
]

{ #category : #'named values' }
ELContentType class >> text [
	^ self value: self textType
]

{ #category : #types }
ELContentType class >> textType [
	^ 'text/plain'
]

{ #category : #'named values' }
ELContentType class >> textWithCharset: aString [
	^ self value: self textType withCharset: aString
]

{ #category : #'named values' }
ELContentType class >> textWithDefaultCharset [
	^ self valueWithDefaultCharset: self textType
]

{ #category : #'named values' }
ELContentType class >> textWithUtf8Charset [
	^ self value: self textType withCharset: self utf8Charset
]

{ #category : #'character sets' }
ELContentType class >> utf8Charset [
	^ 'utf-8'
]

{ #category : #'instance creation' }
ELContentType class >> value: aString [
	^ self new value: aString
]

{ #category : #'instance creation' }
ELContentType class >> value: aString withCharset: charsetString [
	^ self value: aString , ';charset=' , charsetString
]

{ #category : #'instance creation' }
ELContentType class >> valueWithDefaultCharset: aString [
	^ self value: aString withCharset: self defaultCharset
]

{ #category : #converting }
ELContentType >> asHeader [
	^ ELHeader name: self class headerName value: value
]

{ #category : #printing }
ELContentType >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: value;
		nextPut: $)
]

{ #category : #accessing }
ELContentType >> value [
	^ value
]

{ #category : #private }
ELContentType >> value: anObject [
	value := anObject
]
