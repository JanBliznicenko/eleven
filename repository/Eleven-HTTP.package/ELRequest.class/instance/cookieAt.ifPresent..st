accessing - cookies
cookieAt: name ifPresent: presentBlock
	^ self cookies detect: [ :cookie | cookie name = name ] ifFound: presentBlock