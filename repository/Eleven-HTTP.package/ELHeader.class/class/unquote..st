private
unquote: aString
	^ aString first = $"
			ifTrue: [ aString allButFirst allButLast ]
			ifFalse: [ aString ]