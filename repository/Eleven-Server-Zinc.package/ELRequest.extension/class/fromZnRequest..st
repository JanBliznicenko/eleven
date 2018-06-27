*Eleven-Server-Zinc
fromZnRequest: aZnRequest
	^ self new
		originalRequest: aZnRequest;
		method: (ELMethod named: aZnRequest method);
		url: aZnRequest url;
		version: aZnRequest requestLine version;
		headers: (self headersFromZnRequest: aZnRequest);
		entity: aZnRequest entity;
		formState: (self formStateFromZnRequest: aZnRequest);
		fileUploads: (self fileUploadsFromZnRequest: aZnRequest)