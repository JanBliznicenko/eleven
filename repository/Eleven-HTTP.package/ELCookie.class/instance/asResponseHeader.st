converting
asResponseHeader
	^ ELHeader
			name: self class reponseHeaderName
			value: name , '=' , value
			attributes:
				{
					#Expires -> (expiration ifNotNil: [ expiration asEmailString ]).
					#Domain -> domain.
					#Path -> path.
					#HttpOnly -> httpOnly.
					#Secure -> secure
				} asDictionary