instance creation
httpEquivalent: nameString content: contentString
	^ self new
			httpEquivalent: nameString;
			content: contentString