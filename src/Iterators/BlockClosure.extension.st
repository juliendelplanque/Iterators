Extension { #name : #BlockClosure }

{ #category : #'*Iterators' }
BlockClosure >> iteratorShouldSplit: anObject [
	^ self value: anObject
]
