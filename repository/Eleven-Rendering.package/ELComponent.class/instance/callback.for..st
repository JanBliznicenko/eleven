callbacks
callback: aBlock for: request
	^ self
			urlForCallback: (ELCallback with: aBlock)
			in: request session