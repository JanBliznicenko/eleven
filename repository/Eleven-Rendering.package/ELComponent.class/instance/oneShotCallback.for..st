callbacks
oneShotCallback: aBlock for: request
	^ self
			urlForCallback: (ELOneShotCallback with: aBlock)
			in: request session