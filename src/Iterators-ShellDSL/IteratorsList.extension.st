Extension { #name : #IteratorsList }

{ #category : #'*Iterators-ShellDSL' }
IteratorsList >> & anIterator [
	self add: anIterator.
	^ self
]

{ #category : #'*Iterators-ShellDSL' }
IteratorsList >> | anIteratorsWrapper [
	anIteratorsWrapper wrappedIterators: self.
	^ anIteratorsWrapper
]
