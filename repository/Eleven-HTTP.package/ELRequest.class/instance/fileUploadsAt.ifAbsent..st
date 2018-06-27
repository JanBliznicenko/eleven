accessing - file uploads
fileUploadsAt: key ifAbsent: aBlock
	| uploads |
	
	uploads := fileUploads at: key ifAbsent: [ ^ aBlock value ].
	
	^ uploads isCollection
			ifTrue: [ uploads ]
			ifFalse: [ Array with: uploads ]