instance creation
from: aString
	^ (aString includes: ${)
			ifTrue: [
				ELPatternMatcher fromString: aString ]
			ifFalse: [
				ELStringMatcher string: aString ]