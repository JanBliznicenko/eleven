private
attributeAssociationFrom: aString
	| equalSignPosition |
	equalSignPosition := aString indexOf: $= ifAbsent: [ ^ aString trimmed -> true ].
	
	^ (aString first: equalSignPosition - 1) trimmed
			-> (self unquote: (aString allButFirst: equalSignPosition) trimmed)