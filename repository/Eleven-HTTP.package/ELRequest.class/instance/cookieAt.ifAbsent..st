accessing - cookies
cookieAt: name ifAbsent: absentBlock
	^ self cookies detect: [ :cookie | cookie name = name ] ifNone: absentBlock