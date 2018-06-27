*Eleven-Server-Zinc
asZnResponse
	^ ZnResponse new
			statusLine: (ZnStatusLine code: self statusCode);
			headers: self headersAsZnHeaders;
			entity:
				(self entityStream ifNotNil: [ :entityStream |
					entityStream asZnEntityWithType: self contentType ])