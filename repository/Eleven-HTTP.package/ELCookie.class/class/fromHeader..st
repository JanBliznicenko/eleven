instance creation
fromHeader: aHeader
	^ Array
		streamContents: [ :cookieStream | 
			(aHeader value substrings: #($;))
				do: [ :pair | 
					| separatorPosition |
					separatorPosition := pair indexOf: $=.
					separatorPosition = 0
						ifTrue: [ cookieStream nextPut: (self name: pair value: '') ]
						ifFalse:
							[ cookieStream nextPut: (self name: (pair first: separatorPosition - 1) trimmed value: (pair allButFirst: separatorPosition) trimmed) ] ] ]