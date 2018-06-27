instance creation
fromZnMimePart: aZnMimePart
	^ self new
			name: aZnMimePart fieldName;
			filename: aZnMimePart fileName;
			type: aZnMimePart contentType;
			length: aZnMimePart contentLength;
			stream: aZnMimePart entity readStream