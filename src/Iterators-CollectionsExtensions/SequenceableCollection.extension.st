Extension { #name : #SequenceableCollection }

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> basicIterator [
	^ SequentialAccessIterator on: self
]

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> basicReversedIterator [
	^ ReverseSequentialAccessIterator on: self
]

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> iterator [
	^ self basicIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
SequenceableCollection >> reversedIterator [
	^ self basicReversedIterator withCollectionAPI
]
