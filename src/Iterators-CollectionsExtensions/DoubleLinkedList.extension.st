Extension { #name : #DoubleLinkedList }

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> iterator [
	^ LinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]

{ #category : #'*Iterators-CollectionsExtensions' }
DoubleLinkedList >> reversedIterator [
	^ LinkedListIterator on: self lastLink nextLinkBlock: #previousLink extractBlock: #value
]
