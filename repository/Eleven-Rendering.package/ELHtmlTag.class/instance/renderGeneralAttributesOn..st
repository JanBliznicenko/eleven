rendering
renderGeneralAttributesOn: aStream
	attributes ifNil: [ ^ self ].
	
	(attributes associations
		reject: [ :each | #(false nil) includes: each value ])
			do: [ :assoc |
				aStream space.
				aStream nextPutAll: assoc key.
				assoc value ~= true ifTrue: [
					aStream nextPutAll: '="'.
					self renderAttributeValue: assoc value on: aStream.
					aStream nextPut: $" ] ]