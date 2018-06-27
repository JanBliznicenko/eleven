visiting
visitChain: aChain
	aChain elements do: [ :each |
		each accept: self ]