Extension { #name : #TestAsserter }

{ #category : #'*Iterators-Pharo61' }
TestAsserter >> deny: actual equals: expected [
	^ self
		assert: expected ~= actual
		description: 'Unexpected equality.'
]
