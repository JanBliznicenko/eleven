instance creation
name: nameString value: valueString
	((valueString includes: $;)
		and: [ nameString asLowercase ~= 'cookie' and: [ nameString asLowercase ~= 'user-agent' ] ])
		ifTrue: [ ^ self name: nameString trimmed valueWithAttributes: valueString trimmed ].
	^ self name: nameString trimmed value: valueString trimmed attributes: Dictionary new