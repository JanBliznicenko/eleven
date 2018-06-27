printing
writeAttributesTo: aStream
	attributes associationsDo: [ :association |
		aStream nextPutAll: '; '.
		association printAsHeaderAttributeOn: aStream ]