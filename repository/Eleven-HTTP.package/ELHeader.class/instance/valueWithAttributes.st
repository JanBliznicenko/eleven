accessing
valueWithAttributes
	^ attributes
			ifEmpty: [ value ]
			ifNotEmpty: [
				String streamContents: [ :attrStream |
					attrStream nextPutAll: value.
					self writeAttributesTo: attrStream ] ]