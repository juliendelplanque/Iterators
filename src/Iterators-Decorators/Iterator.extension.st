Extension { #name : #Iterator }

{ #category : #'*Iterators-Decorators' }
Iterator >> decoratedBy: anIteratorDecorator [
	^ anIteratorDecorator
		decoratedIterator: self;
		yourself
]

{ #category : #'*Iterators-Decorators' }
Iterator >> removeDuplicates [
	^ self decoratedBy: DuplicateRemoverIterator new
]

{ #category : #'*Iterators-Decorators' }
Iterator >> removeIdentityDuplicates [
	^ self decoratedBy: IdentityDuplicateRemoverIterator new
]

{ #category : #'*Iterators-Decorators' }
Iterator >> withCollectionAPI [
	^ self decoratedBy: IteratorWithCollectionAPI new
]
