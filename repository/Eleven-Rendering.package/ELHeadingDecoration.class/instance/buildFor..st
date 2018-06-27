rendering
buildFor: request
	^ Array
			with: (HtmlHeading level: level with: title)
			with: (self innerComponent)