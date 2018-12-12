Class {
	#name : #ELFormHandler,
	#superclass : #ELHandlerDecorator,
	#category : 'Eleven-Handlers-Forms'
}

{ #category : #constants }
ELFormHandler class >> requestAttributeName [
	^ #form
]

{ #category : #'request handling' }
ELFormHandler >> formIdentifier [
	"Subclasses may override this to provide their own form name."
	^ self identityHash asString
]

{ #category : #'request handling' }
ELFormHandler >> handle: request [
	(self shouldHandle: request) ifTrue: [
		^ request formState copy
				handleBy: self in: request ].
	
	^ self handleEmptyForm: request
]

{ #category : #'form handling' }
ELFormHandler >> handleEmptyForm: request [
	^ self pass:
			(request withFormState:
				(self initialStateFrom: request formState for: request))
]

{ #category : #'form handling' }
ELFormHandler >> handleForm: form in: request [
	"To be redefined by subclasses to provide their own handling."
	
	form pass
]

{ #category : #'form handling' }
ELFormHandler >> handledForms [
	^ #()
]

{ #category : #'form handling' }
ELFormHandler >> initialStateFrom: formState for: request [
	"Subclasses may override this method to provide the initial form state (for rendering before it is submitted for the first time). This method should not alter the original formState! It should return a copy or a new instance instead if it needs to perform any modifications."
	
	^ formState
]

{ #category : #'request handling' }
ELFormHandler >> pass: request [
	^ decoratedHandler handle:
			(request withAttributeAt: self requestAttributeName put: self formIdentifier)
]

{ #category : #'request handling' }
ELFormHandler >> pass: request withFormState: formState [
	^ self pass:
			(request withFormState:
				(self subsequentStateFrom: formState for: request))
]

{ #category : #'request handling' }
ELFormHandler >> redirect: aUrl [
	^ ELSeeOtherResponse url: aUrl
]

{ #category : #constants }
ELFormHandler >> requestAttributeName [
	^ self class requestAttributeName
]

{ #category : #'request handling' }
ELFormHandler >> shouldHandle: request [
	request attributeAt: self requestAttributeName ifPresent: [ :formIdentifier |
		^ self formIdentifier = formIdentifier ].
	
	^ false
]

{ #category : #'form handling' }
ELFormHandler >> subsequentStateFrom: formState for: request [
	"Subclasses may override this method to modify the form state (for rendering after it has been submitted). This method should not alter the original formState! It should return a copy or a new instance instead if it needs to perform any modifications."
	
	^ formState
]

{ #category : #'request handling' }
ELFormHandler >> validateCsrfTokenFrom: request at: key [
	^ self handledForms anySatisfy: [ :each |
			request session validateCsrfToken: (request formState stringAt: key) for: each ]
]

{ #category : #validating }
ELFormHandler >> validationError: aString for: key [
	ELValidationFailed new
		key: key;
		messageText: aString;
		signal
]
