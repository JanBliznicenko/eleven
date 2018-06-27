attributes
class: aString
	(aString includes: Character space)
		ifTrue: [ Character space split: aString do: [ :eachClass | self addClass: eachClass ].
			^ self ].
	self addClass: aString