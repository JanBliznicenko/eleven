accessing
session
	^ originalRequest session
			attributeAt: self sessionKey
			ifAbsentPut: [ self application newSession ]