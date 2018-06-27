instance creation
level: anInteger
	^ ({
			HtmlHeadingLevel1.
			HtmlHeadingLevel2.
			HtmlHeadingLevel3.
			HtmlHeadingLevel4.
			HtmlHeadingLevel5.
			HtmlHeadingLevel6
		} at: anInteger ifAbsent: [
				self error: 'Heading level must be between 1 and 6.' ])
					new