initialization
initialize
	super initialize.
	
	attributes := Dictionary new.
	callbacks := Dictionary new.
	csrfTokens := Dictionary new