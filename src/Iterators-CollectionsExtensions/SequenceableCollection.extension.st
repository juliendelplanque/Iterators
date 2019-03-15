Extension { #name : #SequenceableCollection }

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> iterator [
	^ SequentialAccessIterator on: self
]

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> reversedIterator [
	^ ReverseSequentialAccessIterator on: self
]
