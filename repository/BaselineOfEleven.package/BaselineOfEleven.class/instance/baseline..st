accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Eleven-HTTP';
				package: 'Eleven-Handlers' with: [ spec requires: #('Eleven-HTTP') ];
				package: 'Eleven-Rendering' with: [ spec requires: #('Eleven-Handlers') ];
				package: 'Eleven-Server-Zinc' with: [ spec requires: #('Eleven-Rendering') ] ]