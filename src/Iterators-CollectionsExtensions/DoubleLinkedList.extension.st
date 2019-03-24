Extension { #name : #DoubleLinkedList }

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> basicIterator [
	^ LinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> basicReversedIterator [
	^ LinkedListIterator on: self lastLink nextLinkBlock: #previousLink extractBlock: #value
]

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> iterator [
	^ self basicIterator withCollectionAPI
]

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> reversedIterator [
	^ self basicReversedIterator withCollectionAPI
]
