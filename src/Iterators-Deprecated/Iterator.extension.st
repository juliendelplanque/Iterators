Extension { #name : #Iterator }

{ #category : #'*Iterators-Deprecated' }
Iterator >> expectedUpToEndSize [
	self
		deprecated: 'Use #maximalUpToEndSize instead.'
		transformWith: '`@receiver expectedUpToEndSize' -> '`@receiver maximalUpToEndSize'.
	^ self maximalUpToEndSize
]
