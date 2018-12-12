Class {
	#name : #ELFileUpload,
	#superclass : #Object,
	#instVars : [
		'name',
		'filename',
		'type',
		'stream',
		'length'
	],
	#category : 'Eleven-HTTP-Messages'
}

{ #category : #'instance creation' }
ELFileUpload class >> fromZnMimePart: aZnMimePart [
	^ self new
			name: aZnMimePart fieldName;
			filename: aZnMimePart fileName;
			type: aZnMimePart contentType;
			length: aZnMimePart contentLength;
			stream: aZnMimePart entity readStream
]

{ #category : #accessing }
ELFileUpload >> fileExtension [
	^ self filename asFileReference extension
]

{ #category : #accessing }
ELFileUpload >> filename [
	^ filename
]

{ #category : #private }
ELFileUpload >> filename: anObject [
	filename := anObject
]

{ #category : #accessing }
ELFileUpload >> length [
	^ length
]

{ #category : #private }
ELFileUpload >> length: anObject [
	length := anObject
]

{ #category : #accessing }
ELFileUpload >> name [
	^ name
]

{ #category : #private }
ELFileUpload >> name: anObject [
	name := anObject
]

{ #category : #printing }
ELFileUpload >> printOn: aStream [
	super printOn: aStream.
	
	aStream
		nextPut: $(;
		nextPutAll: name;
		nextPutAll: ': ';
		nextPutAll: filename;
		nextPutAll: ', ';
		nextPutAll: length asString;
		nextPutAll: ' B)'
]

{ #category : #actions }
ELFileUpload >> saveTo: aStream [
	self stream binary.
	
	[ aStream nextPutAll: (self stream next: 16384) ]
		doWhileFalse: [ self stream atEnd ]
]

{ #category : #accessing }
ELFileUpload >> stream [
	^ stream
]

{ #category : #private }
ELFileUpload >> stream: anObject [
	stream := anObject
]

{ #category : #accessing }
ELFileUpload >> type [
	^ type
]

{ #category : #private }
ELFileUpload >> type: anObject [
	type := anObject
]
