events
onClickUrl: anUrl
	^ self
		on: #click
		do: 'event.stopPropagation();location.href="' , anUrl , '";'