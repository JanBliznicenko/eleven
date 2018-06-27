decorating
replacedHeader: aHeader
	^ ELAddHeader
			header: aHeader
			with:
				(ELRemoveHeader
					name: aHeader name
					with: self)