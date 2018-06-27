attributes
securityRules: aStringOrCollection
	"Warning: Cannot be combined with #addSecurityRule: or other shortcut methods."
	^ self
		attributeAt: #sandbox
		put: (self collectionToString: aStringOrCollection joinedUsing: Character space)