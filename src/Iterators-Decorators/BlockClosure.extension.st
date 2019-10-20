Extension { #name : #BlockClosure }

{ #category : #'*Iterators-Decorators' }
BlockClosure >> iteratorShouldSplit: anObject [
	^ self value: anObject
]
