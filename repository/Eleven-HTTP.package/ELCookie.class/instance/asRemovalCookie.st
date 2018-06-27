converting
asRemovalCookie
	^ self class new
			name: name
			value: '';
			expiration: DateAndTime unixEpoch;
			domain: domain;
			path: path