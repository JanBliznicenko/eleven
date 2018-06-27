private
pattern: aString
	pattern := aString.
	patternSegments := ($/ split: aString) collect: [ :each | ELSegmentMatcher from: each ]