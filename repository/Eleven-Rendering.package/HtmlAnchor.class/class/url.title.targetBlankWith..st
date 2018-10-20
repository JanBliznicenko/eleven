instance creation
url: aStringOrUrl title: aTitle targetBlankWith: anObject
	^ self new
		url: aStringOrUrl;
		title: aTitle;
		with: anObject;
		targetBlank;
		yourself