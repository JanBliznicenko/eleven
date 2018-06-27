converting
asResponseFor: request
	^ (super asResponseFor: request)
			withContentType: self contentType