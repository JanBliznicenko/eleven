attributes
target: aString
	"adds noopener and noreferer to all _blank anchors to prevent referer exploiting and improve RNG preformance"

	aString = #_blank
		ifTrue: [ self relationship: 'noopener noreferrer' ].
	^ self attributeAt: #target put: aString