Extension { #name : #LinkedList }

{ #category : #'*Iterators-CollectionsExtensions' }
LinkedList >> iterator [
	^ LinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]

{ #category : #'*Iterators-CollectionsExtensions' }
LinkedList >> reversedIterator [
	^ ReverseLinkedListIterator on: self firstLink nextLinkBlock: #nextLink extractBlock: #value
]
