events
onClickStopPropagation
	^ self
		on: #click
		do: 'event.stopPropagation();'