Extension { #name : #Integer }

{ #category : #'*Iterators-Deprecated' }
Integer >> groupIt [
	self
		deprecated: 'This method is deprecated, use #groupsOfIt instead.'
		transformWith: '`@receiver groupIt' -> '`@receiver groupsOfIt'.
	^ self groupsOfIt
]
