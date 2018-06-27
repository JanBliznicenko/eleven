private
buildQueryString: aDictionary
	^ aDictionary
			ifEmpty: [ '' ]
			ifNotEmpty: [ '?' , ((aDictionary associations collect: [ :each | each key , '=' , each value ]) joinUsing: $&) ]