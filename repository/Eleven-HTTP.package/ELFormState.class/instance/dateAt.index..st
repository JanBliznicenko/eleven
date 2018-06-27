accessing fields
dateAt: key index: anInteger
	| space string |
	space := Character space.
	string := self stringAt: key index: anInteger.
	string := string reject: [ :each | each = space ].
	^ [ Date readFrom: string readStream pattern: 'd.m.yyyy' ]
		on: Error
		do: [ nil ]