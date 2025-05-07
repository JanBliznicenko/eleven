Class {
	#name : 'ELOneShotCallback',
	#superclass : 'ELCallback',
	#category : 'Eleven-Handlers-Callbacks',
	#package : 'Eleven-Handlers',
	#tag : 'Callbacks'
}

{ #category : 'evaluating' }
ELOneShotCallback >> valueForRequest: request withKey: key [
	request session removeCallbackAt: key.
	
	^ super valueForRequest: request withKey: key
]
