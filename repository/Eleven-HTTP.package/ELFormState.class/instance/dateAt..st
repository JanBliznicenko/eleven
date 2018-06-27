accessing fields
dateAt: key
	| space string |
	space := Character space.
	string := self stringAt: key.
	string := string reject: [ :each | each = space ].
	^ [ Date readFrom: string readStream pattern: 'd.m.yyyy' ]
		on: Error
		do: [ nil ]