Extension { #name : #Object }

{ #category : #'*Iterators-Decorators' }
Object >> iteratorShouldSplit: anObject [
	^ self = anObject
]
