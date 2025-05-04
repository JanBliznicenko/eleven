Class {
	#name : 'BaselineOfEleven',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfEleven',
	#package : 'BaselineOfEleven'
}

{ #category : 'baselines' }
BaselineOfEleven >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Base64Extensions'
			with: [
				spec repository: 'github://JanBliznicenko/Base64Extensions' ];
			package: 'Eleven-HTTP'
			with: [ spec requires: #( 'Base64Extensions' ) ];
			package: 'Eleven-Handlers'
			with: [ spec requires: #( 'Eleven-HTTP' ) ];
			package: 'Eleven-Rendering'
			with: [ spec requires: #( 'Eleven-Handlers' ) ];
			package: 'Eleven-Server-Zinc'
			with: [ spec requires: #( 'Eleven-Rendering' ) ] ]
]
