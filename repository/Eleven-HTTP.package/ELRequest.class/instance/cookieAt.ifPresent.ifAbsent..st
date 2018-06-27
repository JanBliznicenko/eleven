accessing - cookies
cookieAt: name ifPresent: presentBlock ifAbsent: absentBlock
	^ self cookies
		detect: [ :cookie | cookie name = name ]
		ifFound: presentBlock
		ifNone: absentBlock